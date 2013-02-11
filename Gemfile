source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'json'
gem 'stringex'

# Database backend
#
platforms :jruby do
	gem 'activerecord-jdbcsqlite3-adapter', :require => 'arjdbc/sqlite3'
	gem 'jdbc-sqlite3'
    	gem 'jdbc-mysql' # fuer datenmigration von mysql
	gem 'jruby-openssl'
end

gem 'paperclip', "~> 3.0"

# View
# 
gem 'haml-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

# Development-Gems
group :development do
  gem 'better_errors'
  gem 'meta_request'
end
#
# Testing-Gems
# 
gem "rspec-rails", :group => [:test, :development]
gem "factory_girl_rails", :group => [:test, :development]
gem "forgery", :group => [:test, :development]
group :test do
	gem 'capybara'
end

# JQuery
gem 'jquery-rails'


# Flexslider
gem "flexslider", '~> 2.0.2'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# ActAsTaggable
gem 'acts-as-taggable-on', '~> 2.3.1'


gem 'formtastic'
