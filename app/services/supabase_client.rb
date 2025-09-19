class SupabaseClient
  include HTTParty
  
  attr_reader :url, :key, :service_key
  
  def initialize
    @url = ENV['SUPABASE_URL']
    @key = ENV['SUPABASE_ANON_KEY']
    @service_key = ENV['SUPABASE_SERVICE_ROLE_KEY']
    
    self.class.base_uri @url
    self.class.headers({
      'Content-Type' => 'application/json',
      'Prefer' => 'return=representation'
    })
  end
  
  # Аутентификация
  def sign_up(email, password, options = {})
    post('/auth/v1/signup', {
      email: email,
      password: password,
      data: options[:data] || {}
    })
  end
  
  def sign_in(email, password)
    post('/auth/v1/token?grant_type=password', {
      email: email,
      password: password
    })
  end
  
  def sign_out(access_token)
    post('/auth/v1/logout', {}, headers_with_auth(access_token))
  end
  
  def get_user(access_token)
    get('/auth/v1/user', headers_with_auth(access_token))
  end
  
  # Database operations
  def select(table, columns = '*', conditions = {})
    query = build_query_string(conditions)
    path = "/rest/v1/#{table}?select=#{columns}#{query}"
    
    get(path, headers_with_service_key)
  end
  
  def insert(table, data)
    post("/rest/v1/#{table}", data, headers_with_service_key)
  end
  
  def update(table, data, conditions = {})
    query = build_query_string(conditions)
    path = "/rest/v1/#{table}?#{query}"
    
    patch(path, data, headers_with_service_key)
  end
  
  def delete(table, conditions = {})
    query = build_query_string(conditions)
    path = "/rest/v1/#{table}?#{query}"
    
    delete_request(path, headers_with_service_key)
  end
  
  # Storage operations
  def upload_file(bucket, path, file)
    # Implementation for file upload to Supabase Storage
    # This would require multipart upload handling
  end
  
  def get_file_url(bucket, path)
    "#{@url}/storage/v1/object/public/#{bucket}/#{path}"
  end
  
  # Real-time subscriptions (via WebSocket)
  def subscribe(table, callback)
    # Implementation for real-time subscriptions
    # Would require WebSocket connection
  end
  
  private
  
  def get(path, headers = {})
    response = self.class.get(path, { headers: default_headers.merge(headers) })
    handle_response(response)
  end
  
  def post(path, data = {}, headers = {})
    response = self.class.post(path, {
      body: data.to_json,
      headers: default_headers.merge(headers)
    })
    handle_response(response)
  end
  
  def patch(path, data = {}, headers = {})
    response = self.class.patch(path, {
      body: data.to_json,
      headers: default_headers.merge(headers)
    })
    handle_response(response)
  end
  
  def delete_request(path, headers = {})
    response = self.class.delete(path, { headers: default_headers.merge(headers) })
    handle_response(response)
  end
  
  def default_headers
    {
      'apikey' => @key,
      'Content-Type' => 'application/json'
    }
  end
  
  def headers_with_auth(access_token)
    {
      'Authorization' => "Bearer #{access_token}"
    }
  end
  
  def headers_with_service_key
    {
      'apikey' => @service_key,
      'Authorization' => "Bearer #{@service_key}"
    }
  end
  
  def build_query_string(conditions)
    return '' if conditions.empty?
    
    query_parts = conditions.map do |key, value|
      case value
      when String
        "#{key}=eq.#{CGI.escape(value)}"
      when Integer, Float
        "#{key}=eq.#{value}"
      when Array
        "#{key}=in.(#{value.map { |v| CGI.escape(v.to_s) }.join(',')})"
      when Hash
        # Handle operators like { gt: 10 }, { like: '%search%' }
        operator = value.keys.first
        val = value.values.first
        "#{key}=#{operator}.#{CGI.escape(val.to_s)}"
      else
        "#{key}=eq.#{CGI.escape(value.to_s)}"
      end
    end
    
    "&#{query_parts.join('&')}"
  end
  
  def handle_response(response)
    case response.code
    when 200, 201
      response.parsed_response
    when 204
      true # No content (successful delete)
    when 400, 401, 403, 404, 409, 422
      {
        error: true,
        message: response.parsed_response&.dig('message') || 'API Error',
        details: response.parsed_response,
        status: response.code
      }
    else
      {
        error: true,
        message: "HTTP Error #{response.code}",
        status: response.code
      }
    end
  rescue JSON::ParserError
    {
      error: true,
      message: 'Invalid JSON response',
      raw_response: response.body
    }
  end
end