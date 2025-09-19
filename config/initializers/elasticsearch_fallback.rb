require 'ostruct'

class SimpleNullSearchResult
  def aggregations
    OpenStruct.new.tap do |a|
      def a.method_missing(name, *args)
        OpenStruct.new(value: 0, buckets: [])
      end
    end
  end

  def response
    OpenStruct.new(hits: OpenStruct.new(total: OpenStruct.new(value: 0)))
  end

  def results
    OpenStruct.new(total: 0)
  end

  def records
    # Return an empty ActiveRecord::Relation if Link is available, otherwise []
    if defined?(Link)
      Link.none
    else
      []
    end
  end
end

ES_ERRORS = [Faraday::ConnectionFailed, Errno::ECONNREFUSED, Faraday::TimeoutError].dup
begin
  unless defined?(Elasticsearch::Transport::Transport::Errors)
    require 'elasticsearch/transport'
  end
rescue LoadError
  # elasticsearch transport gem not available at this point; skip adding its errors
end

if defined?(Elasticsearch::Transport::Transport::Errors)
  ES_ERRORS << Elasticsearch::Transport::Transport::Errors::NoNodeAvailable rescue nil
  ES_ERRORS << Elasticsearch::Transport::Transport::Errors::NotFound rescue nil
end

patch_purchase_search = lambda do
  next unless defined?(Purchase)
  singleton = class << Purchase; self; end

  # Avoid redefining if already patched
  unless singleton.method_defined?(:__orig_search_for_fallback)
    if Purchase.respond_to?(:search)
      singleton.alias_method :__orig_search_for_fallback, :search

      singleton.define_method(:search) do |*args|
        begin
          __orig_search_for_fallback(*args)
        rescue *ES_ERRORS => e
          Rails.logger.warn("Elasticsearch unavailable (Purchase.search): #{e.class} - #{e.message}")
          SimpleNullSearchResult.new
        end
      end
    end
  end
end

patch_product_page_view_search = lambda do
  next unless defined?(ProductPageView)
  singleton = class << ProductPageView; self; end

  # Avoid redefining if already patched
  unless singleton.method_defined?(:__orig_search_for_fallback)
    if singleton.respond_to?(:search)
      singleton.alias_method :__orig_search_for_fallback, :search

      singleton.define_method(:search) do |*args|
        begin
          __orig_search_for_fallback(*args)
        rescue *ES_ERRORS => e
          Rails.logger.warn("Elasticsearch unavailable (ProductPageView.search): #{e.class} - #{e.message}")
          SimpleNullSearchResult.new
        end
      end
    end
  end
end

# Try to patch immediately if Purchase is already loaded, otherwise defer until ActiveRecord loads
if defined?(Purchase) && Purchase.respond_to?(:search)
  patch_purchase_search.call
else
  ActiveSupport.on_load(:active_record) do
    patch_purchase_search.call
  end
end

# Try to patch immediately if ProductPageView is already loaded, otherwise defer until ActiveRecord loads
if defined?(ProductPageView) && ProductPageView.respond_to?(:search)
  patch_product_page_view_search.call
else
  ActiveSupport.on_load(:active_record) do
    patch_product_page_view_search.call
  end
end
