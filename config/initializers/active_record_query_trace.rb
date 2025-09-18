# frozen_string_literal: true

if Rails.env.development? && defined?(ActiveRecordQueryTrace)
  ActiveRecordQueryTrace.enabled = (ENV["QUERY_TRACE"] == "1")
end
