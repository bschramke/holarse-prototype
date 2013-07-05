source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'json'
gem 'stringex'

group :production do
  gem 'trinidad'
end

# Database backend
#
gem 'activerecord-jdbcsqlite3-adapter', :require => 'arjdbc/sqlite3'
gem 'jdbc-sqlite3'
gem 'jdbc-mysql' # fuer datenmigration von mysql

gem 'amoeba'

gem 'paperclip', "~> 3.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'formtastic-bootstrap'
end

# View
# 
gem 'kramdown'
#gem 'wikicloth'

# Development-Gems
group :development do
  gem 'better_errors'
  gem 'meta_request'
end

gem 'jquery-rails', '~> 2.1'
gem 'jquery-ui-rails'

#
# Testing-Gems
# 
gem "rspec-rails", :group => [:test, :development]
gem "factory_girl_rails", :group => [:test, :development]
gem "fabrication", :group => [:test, :development]
gem "capybara", :group => [:test]
gem "faker", :group => [:test], :require => "faker"

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# ActAsTaggable
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'formtastic'
