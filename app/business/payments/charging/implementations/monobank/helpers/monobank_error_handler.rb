# frozen_string_literal: true

module MonobankErrorHandler
  private

  def with_monobank_error_handler
    yield
  rescue HTTParty::Error => e
    raise ChargeProcessorUnavailableError.new("Monobank API connection error: #{e.message}", original_error: e)
  rescue StandardError => e
    # Handle generic errors from Monobank API
    if e.message.include?("Failed to create Monobank invoice") ||
       e.message.include?("Failed to get Monobank invoice status") ||
       e.message.include?("Monobank API credentials not configured")
      raise ChargeProcessorUnavailableError.new(e.message, original_error: e)
    else
      raise ChargeProcessorInvalidRequestError.new(e.message, original_error: e)
    end
  end
end