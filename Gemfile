source 'https://rubygems.org'

gem 'rails', '3.2.15'

gem 'json'
gem 'stringex'

group :production do
  gem 'puma'
  gem 'dalli' # memcache
end

# Database backend
#
gem 'activerecord-jdbcsqlite3-adapter', "~> 1.3.2", :require => 'arjdbc/sqlite3'
gem 'jdbc-sqlite3'
gem 'jdbc-mysql', "~> 5.1.25" # fuer datenmigration von mysql

gem 'paper_trail'
gem 'paperclip', "~> 3.0"
gem 'draper', '~> 1.0' # model decoration

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'haml-rails'
end

gem 'font-awesome-rails'

# View
# 
gem 'kramdown'
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
gem "fabrication", :group => [:test, :development]
gem "capybara", :group => [:test]
gem "faker", :group => [:test], :require => "faker"

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# ActAsTaggable
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'formtastic'
gem 'formtastic-bootstrap'
gem "breadcrumbs_on_rails"

# jquery
gem "jquery-rails", "~> 3.0.4"
gem "jquery-ui-rails"

# moustache for templating
gem 'mustache-js-rails'
gem 'momentjs-rails'
