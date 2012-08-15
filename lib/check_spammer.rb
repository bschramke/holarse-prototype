require "net/http"
require "uri"
require "rubygems"
require "json"

def check_spammer(email="")
	uri = URI.parse("http://www.stopforumspam.com/api?f=json&email=#{email}")

	response = Net::HTTP.get_response(uri)
	data = response.body

	hash = JSON.parse data

	#p hash
	hash['email']['appears'] == 1
end
