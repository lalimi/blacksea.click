# frozen_string_literal: true

class MonobankChargeIntent
  attr_reader :invoice_id, :page_url, :amount_cents, :currency, :reference, :merchant_account, :status

  def initialize(invoice_id:, page_url:, amount_cents:, currency:, reference:, merchant_account: nil)
    @invoice_id = invoice_id
    @page_url = page_url
    @amount_cents = amount_cents
    @currency = currency
    @reference = reference
    @merchant_account = merchant_account
    @status = "requires_payment_method" # Similar to Stripe's status
  end

  def id
    invoice_id
  end

  def succeeded?
    false # Invoice creation doesn't mean payment succeeded
  end

  def requires_confirmation?
    false
  end

  def requires_payment_method?
    true
  end

  def next_action
    {
      type: "redirect_to_url",
      redirect_to_url: {
        url: page_url,
        return_url: "#{GlobalConfig.get('DOMAIN')}/orders/#{reference}/confirm"
      }
    }
  end

  def charges
    [] # Monobank doesn't provide charges array like Stripe
  end

  def latest_charge
    invoice_id
  end

  def confirm
    # For Monobank, confirmation happens via webhook
    self
  end

  def cancel
    # Monobank invoices can't be cancelled via API
    self
  end
end