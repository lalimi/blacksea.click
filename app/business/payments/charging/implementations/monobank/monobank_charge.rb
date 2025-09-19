# frozen_string_literal: true

class MonobankCharge
  attr_reader :invoice_id, :status, :amount_cents, :currency, :reference, :merchant_account

  def initialize(invoice_id:, status:, amount_cents:, currency:, reference:, merchant_account: nil)
    @invoice_id = invoice_id
    @status = status
    @amount_cents = amount_cents
    @currency = currency
    @reference = reference
    @merchant_account = merchant_account
  end

  def id
    invoice_id
  end

  def succeeded?
    status == MonobankChargeProcessor::INVOICE_STATUS_SUCCESS
  end

  def failed?
    status == MonobankChargeProcessor::INVOICE_STATUS_FAILURE
  end

  def expired?
    status == MonobankChargeProcessor::INVOICE_STATUS_EXPIRED
  end

  def processing?
    status == MonobankChargeProcessor::INVOICE_STATUS_PROCESSING
  end

  def created?
    status == MonobankChargeProcessor::INVOICE_STATUS_CREATED
  end

  def paid?
    succeeded?
  end

  def amount
    amount_cents
  end

  def currency_code
    currency
  end

  def balance_transaction
    nil # Monobank doesn't provide balance transaction details
  end

  def refunds
    [] # Monobank doesn't support refunds via API
  end

  def metadata
    { "purchase" => reference }
  end

  def transfer_group
    reference
  end

  def transfer
    nil # Monobank doesn't have transfer concept like Stripe
  end

  def destination
    nil # Monobank doesn't have destination concept like Stripe
  end

  def application_fee
    nil # Monobank doesn't have application fee concept like Stripe
  end

  def transfer_data
    nil # Monobank doesn't have transfer data concept like Stripe
  end
end