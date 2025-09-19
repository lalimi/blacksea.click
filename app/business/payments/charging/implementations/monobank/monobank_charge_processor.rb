# frozen_string_literal: true

require_relative "helpers/monobank_error_handler"

class MonobankChargeProcessor
  include MonobankErrorHandler
  extend CurrencyHelper

  DISPLAY_NAME = "Monobank"

  # Monobank invoice statuses
  INVOICE_STATUS_CREATED = "created"
  INVOICE_STATUS_PROCESSING = "processing"
  INVOICE_STATUS_SUCCESS = "success"
  INVOICE_STATUS_FAILURE = "failure"
  INVOICE_STATUS_EXPIRED = "expired"

  VALID_TRANSACTION_STATUSES = [INVOICE_STATUS_SUCCESS].freeze

  def self.charge_processor_id
    "monobank"
  end

  def merchant_migrated?(merchant_account)
    # Monobank doesn't have connect accounts like Stripe
    false
  end

  def get_chargeable_for_params(params, _gumroad_guid)
    # Monobank uses invoice-based payments, so we create a simple chargeable
    MonobankChargeableInvoice.new(
      amount_cents: params[:amount_cents],
      currency: params[:currency] || "UAH",
      description: params[:description],
      reference: params[:reference]
    )
  end

  def get_chargeable_for_data(reusable_token, payment_method_id, fingerprint,
                             stripe_setup_intent_id, stripe_payment_intent_id,
                             last4, number_length, visual, expiry_month, expiry_year,
                             card_type, country, zip_code = nil, merchant_account: nil)
    # For Monobank, we don't store card data like Stripe
    # This method is mainly for compatibility with existing interfaces
    MonobankChargeableInvoice.new(
      amount_cents: 0, # Will be set later
      currency: "UAH",
      description: "",
      reference: ""
    )
  end

  def create_payment_intent_or_charge!(merchant_account, chargeable, amount_cents, amount_for_gumroad_cents, reference,
                                      description, metadata: nil, statement_description: nil,
                                      transfer_group: nil, off_session: true, setup_future_charges: false, mandate_options: nil)

    with_monobank_error_handler do
      # Create invoice via Monobank API
      invoice_response = create_monobank_invoice(
        amount_cents: amount_cents,
        currency: "UAH",
        description: description,
        reference: reference,
        merchant_account: merchant_account
      )

      if invoice_response.success?
        invoice_data = invoice_response.parsed_response

        # Create a charge intent-like object for Monobank
        MonobankChargeIntent.new(
          invoice_id: invoice_data["invoiceId"],
          page_url: invoice_data["pageUrl"],
          amount_cents: amount_cents,
          currency: "UAH",
          reference: reference,
          merchant_account: merchant_account
        )
      else
        raise ChargeProcessorUnavailableError.new("Failed to create Monobank invoice: #{invoice_response.message}")
      end
    end
  end

  def get_charge(invoice_id, merchant_account: nil)
    with_monobank_error_handler do
      # Get invoice status from Monobank
      status_response = get_monobank_invoice_status(invoice_id, merchant_account)

      if status_response.success?
        status_data = status_response.parsed_response

        MonobankCharge.new(
          invoice_id: invoice_id,
          status: status_data["status"],
          amount_cents: status_data["amount"],
          currency: status_data["ccy"],
          reference: status_data["reference"],
          merchant_account: merchant_account
        )
      else
        raise ChargeProcessorUnavailableError.new("Failed to get Monobank invoice status: #{status_response.message}")
      end
    end
  end

  def get_charge_intent(invoice_id, merchant_account: nil)
    # For Monobank, invoice serves as payment intent
    get_charge(invoice_id, merchant_account: merchant_account)
  end

  def confirm_payment_intent!(merchant_account, invoice_id)
    # Check if invoice is paid
    charge = get_charge(invoice_id, merchant_account: merchant_account)

    if charge.status == INVOICE_STATUS_SUCCESS
      charge
    else
      raise ChargeProcessorInvalidRequestError.new("Monobank invoice not yet paid")
    end
  end

  def refund!(invoice_id, amount_cents: nil, merchant_account: nil, reverse_transfer: true, is_for_fraud: nil, **_args)
    # Monobank doesn't support direct refunds through API
    # Refunds would need to be handled manually or through their merchant portal
    raise ChargeProcessorInvalidRequestError.new("Monobank does not support API refunds")
  end

  def holder_of_funds(merchant_account)
    # For Monobank, funds go directly to merchant
    HolderOfFunds::CREATOR
  end

  def transaction_url(invoice_id)
    # Monobank doesn't provide a direct transaction URL
    # Return the invoice page URL instead
    nil
  end

  private

  def create_monobank_invoice(amount_cents:, currency:, description:, reference:, merchant_account:)
    require 'httparty'

    api_key = GlobalConfig.get("MONOBANK_API_KEY")
    merchant_id = GlobalConfig.get("MONOBANK_MERCHANT_ID")

    unless api_key.present? && merchant_id.present?
      raise ChargeProcessorUnavailableError.new("Monobank API credentials not configured")
    end

    # Convert cents to currency units (Monobank expects amount in currency units, not cents)
    amount = amount_cents / 100.0

    payload = {
      merchantId: merchant_id,
      amount: amount,
      ccy: currency == "UAH" ? 980 : 840, # Monobank currency codes: 980 = UAH, 840 = USD
      description: description,
      reference: reference,
      redirectUrl: "#{GlobalConfig.get('DOMAIN')}/orders/#{reference}/confirm",
      webhookUrl: "#{GlobalConfig.get('DOMAIN')}/webhooks/monobank"
    }

    HTTParty.post(
      "https://api.monobank.ua/api/merchant/invoice/create",
      headers: {
        'Content-Type' => 'application/json',
        'X-Token' => api_key
      },
      body: payload.to_json
    )
  end

  def get_monobank_invoice_status(invoice_id, merchant_account)
    require 'httparty'

    api_key = GlobalConfig.get("MONOBANK_API_KEY")

    HTTParty.get(
      "https://api.monobank.ua/api/merchant/invoice/status/#{invoice_id}",
      headers: {
        'X-Token' => api_key
      }
    )
  end
end