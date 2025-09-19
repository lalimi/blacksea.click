# frozen_string_literal: true

class MonobankChargeableInvoice
  attr_reader :amount_cents, :currency, :description, :reference

  def initialize(amount_cents:, currency:, description:, reference:)
    @amount_cents = amount_cents
    @currency = currency
    @description = description
    @reference = reference
  end

  def prepare!
    # No preparation needed for Monobank invoices
    self
  end

  def country
    # Monobank is Ukraine-based
    "UA"
  end

  def requires_mandate?
    false
  end

  def stripe_charge_params
    # Return empty hash for compatibility
    {}
  end
end