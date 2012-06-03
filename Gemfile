source 'https://rubygems.org'

gem 'rails', '3.2.5'
gem 'mysql2'

gem 'json'

# Database backend
#
gem 'mongoid'
gem 'bson_ext'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'mongoid_slug'
gem 'mongoid_fulltext'

# JRuby-specific
gem 'jruby-openssl'

# View
# 
gem 'haml-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
end

#
# Testing-Gems
# 
gem "rspec-rails", :group => [:test, :development]
group :test do
	gem 'factory_girl_rails'
	gem 'capybara'
  gem 'forgery'
  gem 'mongoid-rspec'
end

# JQuery
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'
