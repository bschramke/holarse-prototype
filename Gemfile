source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'json'
gem 'stringex'

group :production do
  gem 'trinidad'
end

# Database backend
#
platforms :jruby do
	gem 'activerecord-jdbcsqlite3-adapter', :require => 'arjdbc/sqlite3'
	gem 'jdbc-sqlite3'
    	gem 'jdbc-mysql' # fuer datenmigration von mysql
	gem 'jruby-openssl'
end

gem 'amoeba'

gem 'paperclip', "~> 3.0"

# View
# 
gem 'haml-rails'
gem 'sass-rails'
gem 'kramdown'
#gem 'RedCloth'
#gem 'red_cloth_formatters_plain', :git => 'git://github.com/JosephHalter/redcloth-formatters-plain.git'
#gem 'wikicloth'

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
