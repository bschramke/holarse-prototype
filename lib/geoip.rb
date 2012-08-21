require "net/http"
require "uri"
require "rubygems"
require "json"

def request_geoip(ip, format)
 uri = URI.parse("http://freegeoip.net/#{format}/#{ip}")
 response = Net::HTTP.get_response(uri)
 data = response.body
 JSON.parse data
end

result = request_geoip(ARGV[0], "json")
p result['country_code']
