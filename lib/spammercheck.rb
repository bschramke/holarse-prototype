require "net/http"
require "uri"
require "rubygems"
require "json"

def add_spammer(spammer_username, spammer_ipaddr, spammer_evidence, spammer_email, api_key) 
	uri = URI.parse("http://www.stopforumspam.com/add.php?username=#{spammer_username}&ip_addr=#{spammer_ipaddr}&evidence=#{spammer_evidence}&email=#{spammer_email}&api_key=#{api_key}")
	Net::HTTP.get(uri)
end
	
def request_spammer(email)
	uri = URI.parse("http://www.stopforumspam.com/api?f=json&email=#{email}")

	response = Net::HTTP.get_response(uri)
	data = response.body

	JSON.parse data
end

def is_spammer(result)
	result['email']['appears'] == 1
end

result = request_spammer(ARGV[0])
if is_spammer(result)
 puts "#{ARGV[0]} seems to be a spammer, with confidence #{result['email']['confidence']}"
else
 puts "#{ARGV[0]} seems not to appear"
end