# B2B Lead Enrichment Service
# This service automatically fills missing data in lead tables by searching external sources

require 'net/http'
require 'json'
require 'uri'
require 'nokogiri'
require 'csv'

class LeadEnrichmentService
  LINKEDIN_BASE_URL = 'https://www.linkedin.com'
  USER_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
  
  def initialize
    @http_client = Net::HTTP
    @headers = {
      'User-Agent' => USER_AGENT,
      'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
      'Accept-Language' => 'en-US,en;q=0.5',
      'Accept-Encoding' => 'gzip, deflate, br',
      'Connection' => 'keep-alive',
      'Upgrade-Insecure-Requests' => '1'
    }
  end

  # Main method to enrich leads from CSV file
  def enrich_leads_from_csv(input_file, output_file)
    leads = load_leads_from_csv(input_file)
    enriched_leads = leads.map { |lead| enrich_lead(lead) }
    save_leads_to_csv(enriched_leads, output_file)
    enriched_leads
  end

  # Enrich a single lead
  def enrich_lead(lead)
    puts "Enriching lead: #{lead[:name]} from #{lead[:company]}"
    
    # Find LinkedIn profile if missing
    if lead[:prooflink].nil? || lead[:prooflink].empty?
      lead[:prooflink] = find_linkedin_profile(lead[:name], lead[:company], lead[:job_title])
    end
    
    # Find company phone if missing
    if lead[:phone].nil? || lead[:phone].empty?
      lead[:phone] = find_company_phone(lead[:company])
    end
    
    # Find company LinkedIn if missing
    if lead[:employees_prooflink].nil? || lead[:employees_prooflink].empty?
      lead[:employees_prooflink] = find_company_linkedin(lead[:company])
    end
    
    lead
  end

  private

  def load_leads_from_csv(file_path)
    leads = []
    @column_mapping = detect_column_mapping(file_path)
    
    # Read CSV without header conversion to preserve original headers
    csv_data = CSV.read(file_path, headers: true)
    
    csv_data.each do |row|
      lead = {}
      @column_mapping.each do |standard_name, actual_name|
        if actual_name
          # Use the actual column name from the CSV
          lead[standard_name] = row[actual_name.to_s]
        end
      end
      leads << lead
    end
    leads
  end

  def detect_column_mapping(file_path)
    # Read headers from first row
    headers = CSV.open(file_path, 'r', headers: true).read.headers
    
    mapping = {
      name: nil,
      job_title: nil,
      company: nil,
      phone: nil,
      prooflink: nil,
      employees_prooflink: nil
    }
    
    # Define possible column names for each field
    column_patterns = {
      name: ['name', 'имя', 'full name', 'contact name', 'person name', 'employee name', '姓名'],
      job_title: ['job_title', 'title', 'position', 'role', 'job', 'designation', 'должность', '职位'],
      company: ['company', 'organization', 'firm', 'employer', 'company name', 'компания', '公司'],
      phone: ['phone', 'telephone', 'mobile', 'contact number', 'phone number', 'телефон', '电话'],
      prooflink: ['prooflink', 'linkedin', 'linkedin profile', 'profile link', 'social profile', 'linkedin url'],
      employees_prooflink: ['employees_prooflink', 'company linkedin', 'company profile', 'company linkedin page']
    }
    
    # Map actual headers to standard names
    headers.each do |header|
      header_lower = header.downcase.strip
      column_patterns.each do |standard_name, patterns|
        patterns.each do |pattern|
          if header_lower.include?(pattern.downcase)
            mapping[standard_name] = header.to_sym
            break
          end
        end
      end
    end
    
    puts "Detected column mapping:"
    mapping.each { |k, v| puts "  #{k}: #{v}" }
    
    mapping
  end

  def save_leads_to_csv(leads, file_path)
    return if leads.empty?
    
    headers = leads.first.keys
    CSV.open(file_path, 'w', write_headers: true, headers: headers) do |csv|
      leads.each do |lead|
        csv << lead.values
      end
    end
  end

  def find_linkedin_profile(name, company, job_title)
    puts "Searching LinkedIn profile for #{name} at #{company}"
    
    # Try different search combinations
    search_queries = [
      "#{name} #{company} #{job_title}",
      "#{name} #{company}",
      "#{name} #{job_title}",
      name
    ]
    
    search_queries.each do |query|
      profile_url = search_linkedin_profile(query, company, job_title)
      return profile_url if profile_url
    end
    
    "Not available"
  end

  def search_linkedin_profile(query, company, job_title)
    begin
      # Search on LinkedIn
      search_url = "#{LINKEDIN_BASE_URL}/search/results/people/?keywords=#{URI.encode_www_form_component(query)}"
      response = make_request(search_url)
      
      return nil unless response
      
      # Parse search results
      doc = Nokogiri::HTML(response)
      
      # Look for profile links in search results
      profile_links = doc.css('a[href*="/in/"]').map { |link| link['href'] }.uniq
      
      profile_links.each do |link|
        full_url = link.start_with?('http') ? link : "#{LINKEDIN_BASE_URL}#{link}"
        if verify_profile_match(full_url, company, job_title)
          return full_url
        end
      end
      
      nil
    rescue => e
      puts "Error searching LinkedIn profile: #{e.message}"
      nil
    end
  end

  def verify_profile_match(profile_url, company, job_title)
    begin
      response = make_request(profile_url)
      return false unless response
      
      doc = Nokogiri::HTML(response)
      
      # Check if company and job title match
      page_text = doc.text.downcase
      company_match = page_text.include?(company.downcase)
      job_title_match = page_text.include?(job_title.downcase)
      
      company_match && job_title_match
    rescue => e
      puts "Error verifying profile match: #{e.message}"
      false
    end
  end

  def find_company_phone(company)
    puts "Searching phone number for #{company}"
    
    # Try company website first
    phone = find_phone_from_company_website(company)
    return phone if phone
    
    # Try LinkedIn company page
    phone = find_phone_from_linkedin_company(company)
    return phone if phone
    
    # Try business directories
    phone = find_phone_from_directories(company)
    return phone if phone
    
    "Not available"
  end

  def find_phone_from_company_website(company)
    begin
      # Try to find company website
      website = find_company_website(company)
      return nil unless website
      
      response = make_request(website)
      return nil unless response
      
      doc = Nokogiri::HTML(response)
      
      # Look for phone numbers in common locations
      phone_selectors = [
        'a[href^="tel:"]',
        '.phone', '.telephone', '.contact-phone',
        '[class*="phone"]', '[class*="tel"]',
        'footer', '.footer', '#footer'
      ]
      
      phone_selectors.each do |selector|
        elements = doc.css(selector)
        elements.each do |element|
          phone = extract_phone_number(element.text)
          return phone if phone
        end
      end
      
      nil
    rescue => e
      puts "Error finding phone from website: #{e.message}"
      nil
    end
  end

  def find_company_website(company)
    begin
      # Search for company website
      search_query = "#{company} official website"
      # This would typically use a search API, but for now we'll try common patterns
      common_domains = ['.com', '.cn', '.net', '.org']
      
      common_domains.each do |domain|
        test_url = "https://www.#{company.downcase.gsub(/\s+/, '')}#{domain}"
        response = make_request(test_url)
        return test_url if response
      end
      
      nil
    rescue => e
      puts "Error finding company website: #{e.message}"
      nil
    end
  end

  def find_phone_from_linkedin_company(company)
    begin
      company_linkedin = find_company_linkedin(company)
      return nil if company_linkedin == "Not available"
      
      response = make_request(company_linkedin)
      return nil unless response
      
      doc = Nokogiri::HTML(response)
      
      # Look for contact information on company LinkedIn page
      contact_section = doc.css('.contact-info, .company-page-contact, .about-us')
      contact_section.each do |section|
        phone = extract_phone_number(section.text)
        return phone if phone
      end
      
      nil
    rescue => e
      puts "Error finding phone from LinkedIn: #{e.message}"
      nil
    end
  end

  def find_phone_from_directories(company)
    # This would integrate with business directory APIs
    # For now, return nil as placeholder
    nil
  end

  def find_company_linkedin(company)
    puts "Searching LinkedIn company page for #{company}"
    
    begin
      search_url = "#{LINKEDIN_BASE_URL}/search/results/companies/?keywords=#{URI.encode_www_form_component(company)}"
      response = make_request(search_url)
      
      return "Not available" unless response
      
      doc = Nokogiri::HTML(response)
      
      # Look for company page links
      company_links = doc.css('a[href*="/company/"]').map { |link| link['href'] }.uniq
      
      company_links.each do |link|
        full_url = link.start_with?('http') ? link : "#{LINKEDIN_BASE_URL}#{link}"
        if verify_company_match(full_url, company)
          return full_url
        end
      end
      
      "Not available"
    rescue => e
      puts "Error finding company LinkedIn: #{e.message}"
      "Not available"
    end
  end

  def verify_company_match(company_url, company)
    begin
      response = make_request(company_url)
      return false unless response
      
      doc = Nokogiri::HTML(response)
      page_text = doc.text.downcase
      
      # Check if company name appears in the page
      page_text.include?(company.downcase)
    rescue => e
      puts "Error verifying company match: #{e.message}"
      false
    end
  end

  def extract_phone_number(text)
    # Extract Chinese phone numbers and international formats
    phone_patterns = [
      /\+86\s?1[3-9]\d{9}/,  # Chinese mobile
      /\+86\s?\d{3,4}[-\s]?\d{7,8}/,  # Chinese landline
      /1[3-9]\d{9}/,  # Chinese mobile without country code
      /\d{3,4}[-\s]?\d{7,8}/,  # Chinese landline without country code
      /\+\d{1,3}[-\s]?\d{6,14}/  # International format
    ]
    
    phone_patterns.each do |pattern|
      match = text.match(pattern)
      return match[0] if match
    end
    
    nil
  end

  def make_request(url)
    uri = URI.parse(url)
    http = @http_client.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    
    request = Net::HTTP::Get.new(uri.request_uri, @headers)
    response = http.request(request)
    
    return nil unless response.is_a?(Net::HTTPSuccess)
    
    response.body
  rescue => e
    puts "HTTP request failed: #{e.message}"
    nil
  end
end

# Usage example and CLI interface
if __FILE__ == $0
  require 'optparse'
  
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby lead_enrichment_service.rb [options]"
    
    opts.on("-i", "--input FILE", "Input CSV file with leads") do |file|
      options[:input] = file
    end
    
    opts.on("-o", "--output FILE", "Output CSV file for enriched leads") do |file|
      options[:output] = file
    end
    
    opts.on("-h", "--help", "Prints this help") do
      puts opts
      exit
    end
  end.parse!
  
  if options[:input].nil? || options[:output].nil?
    puts "Please provide both input and output file paths"
    puts "Example: ruby lead_enrichment_service.rb -i leads.csv -o enriched_leads.csv"
    exit 1
  end
  
  service = LeadEnrichmentService.new
  service.enrich_leads_from_csv(options[:input], options[:output])
  puts "Lead enrichment completed! Results saved to #{options[:output]}"
end
