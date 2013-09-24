source 'https://rubygems.org'

gem 'rails', '3.2.14'

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

gem 'paper_trail'
gem 'paperclip', "~> 3.0"
gem 'draper', '~> 1.0' # model decoration

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
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
gem 'formtastic-bootstrap'
gem "breadcrumbs_on_rails"

# moustache for templating
gem 'mustache-js-rails'
