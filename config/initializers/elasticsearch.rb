# frozen_string_literal: true

EsClient = Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: ENV.fetch("ELASTICSEARCH_HOST", "http://127.0.0.1:9200"),
  retry_on_failure: 5,
  transport_options: { request: { timeout: 5 } },
  log: true
)

USE_ES_ALIASES = Rails.env.production? || (Rails.env.staging? && ENV["BRANCH_DEPLOYMENT"] != "true")
