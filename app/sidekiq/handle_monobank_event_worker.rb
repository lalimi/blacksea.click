# frozen_string_literal: true

class HandleMonobankEventWorker
  include Sidekiq::Worker

  def perform(payload)
    Rails.logger.info("Processing Monobank webhook: #{payload}")

    invoice_id = payload["invoiceId"]
    status = payload["status"]
    reference = payload["reference"]

    return unless invoice_id.present? && status.present?

    # Find the purchase by reference
    purchase = Purchase.find_by(external_id: reference)
    return unless purchase

    Rails.logger.info("Found purchase #{purchase.id} for Monobank invoice #{invoice_id}")

    case status
    when "success"
      handle_successful_payment(purchase, payload)
    when "failure"
      handle_failed_payment(purchase, payload)
    when "expired"
      handle_expired_payment(purchase, payload)
    else
      Rails.logger.info("Unhandled Monobank status: #{status}")
    end
  rescue => e
    Rails.logger.error("Error processing Monobank webhook: #{e.message}")
    Bugsnag.notify(e, { payload: payload })
  end

  private

  def handle_successful_payment(purchase, payload)
    Rails.logger.info("Processing successful Monobank payment for purchase #{purchase.id}")

    # Update purchase status
    purchase.update!(
      purchase_state: "paid",
      succeeded_at: Time.current
    )

    # Create charge record
    create_charge_for_purchase(purchase, payload)

    # Send receipt email
    PurchaseMailer.receipt_email(purchase).deliver_later

    Rails.logger.info("Successfully processed Monobank payment for purchase #{purchase.id}")
  end

  def handle_failed_payment(purchase, payload)
    Rails.logger.info("Processing failed Monobank payment for purchase #{purchase.id}")

    purchase.update!(
      purchase_state: "failed",
      error_code: payload["error_code"] || "payment_failed"
    )

    Rails.logger.info("Marked purchase #{purchase.id} as failed")
  end

  def handle_expired_payment(purchase, payload)
    Rails.logger.info("Processing expired Monobank payment for purchase #{purchase.id}")

    purchase.update!(
      purchase_state: "expired"
    )

    Rails.logger.info("Marked purchase #{purchase.id} as expired")
  end

  def create_charge_for_purchase(purchase, payload)
    # Create a charge record for the successful payment
    Charge.create!(
      order_id: purchase.order_id,
      seller_id: purchase.seller_id,
      processor: "monobank",
      processor_transaction_id: payload["invoiceId"],
      payment_method_fingerprint: payload["payment_method_fingerprint"] || "monobank",
      merchant_account_id: purchase.merchant_account_id,
      amount_cents: purchase.price_cents,
      gumroad_amount_cents: calculate_gumroad_fee(purchase.price_cents),
      processor_fee_cents: 0, # Monobank fees are handled separately
      created_at: Time.current
    )
  end

  def calculate_gumroad_fee(amount_cents)
    # Calculate Gumroad's fee (typically 5% + 30 cents)
    fee_percentage = 0.05
    fee_fixed = 30

    (amount_cents * fee_percentage).to_i + fee_fixed
  end
end