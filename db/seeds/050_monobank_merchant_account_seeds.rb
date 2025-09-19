# frozen_string_literal: true

# Create the shared Monobank merchant account
if MerchantAccount.gumroad(MonobankChargeProcessor.charge_processor_id).nil?
  merchant_account_monobank = MerchantAccount.new
  merchant_account_monobank.charge_processor_id = MonobankChargeProcessor.charge_processor_id
  merchant_account_monobank.charge_processor_merchant_id = nil # Monobank doesn't require a merchant ID for basic setup
  merchant_account_monobank.currency = "UAH"
  merchant_account_monobank.save!
end