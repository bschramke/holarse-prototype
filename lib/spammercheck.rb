module Holarse
  module Spam

    class Spammer
      attr_accessor :username, :ipaddr, :evidence, :email
    end

    class SpammerCheck
      def is_spammer?(possible_spammer)
        Rails.logger.debug("Checking for spammer record for #{possible_spammer}")
        check_remote(possible_spammer)
      end

      private

      def check_remote(possible_spammer)
        StopForumSpam.new.is_spammer?(possible_spammer)          
      end 

    end

    class StopForumSpam
      require "net/http"
      require "uri"
      require "rubygems"
      require "json"

      def is_spammer?(possible_spammer)
        ask_service(possible_spammer.email)['email']['appears'] == 1
      end

      def add_as_spammer(spammer)
        add_spammer(spammer.username, spammer.ipaddr, spammer.evidence, spammer_email, Holarse::Application.config.sfs_api_key)
      end

      private

      def ask_service(email)
        uri = URI.parse("http://www.stopforumspam.com/api?f=json&email=#{email}")

        response = Net::HTTP.get_response(uri)
        data = response.body

        JSON.parse data
      end  

      def add_spammer(spammer_username, spammer_ipaddr, spammer_evidence, spammer_email, api_key) 
      	uri = URI.parse("http://www.stopforumspam.com/add.php?username=#{spammer_username}&ip_addr=#{spammer_ipaddr}&evidence=#{spammer_evidence}&email=#{spammer_email}&api_key=#{api_key}")
      	Net::HTTP.get(uri)
      end
    end	
  end
end
