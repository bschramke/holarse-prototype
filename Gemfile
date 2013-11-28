source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '4.0.1'

gem 'json'
gem 'stringex'

# rails 4 easy migration
gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'activerecord-deprecated_finders'

group :production do
  gem 'puma'
#  gem 'dalli' # memcache
end

# Database backend
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter', "~> 1.3.3", :require => 'arjdbc/sqlite3'
  gem 'jdbc-sqlite3'
  #gem 'jdbc-mysql', "~> 5.1.25" # fuer datenmigration von mysql
end

platforms :ruby do
  gem "sqlite3"
end

gem 'paper_trail', '>= 3.0.0.rc2'
gem 'paperclip', "~> 3.0"
gem 'draper', '~> 1.3.0' # model decoration

gem 'sass-rails',   '~> 4.0.1'
gem 'haml-rails'

gem 'font-awesome-rails'

# View
# 
gem 'kramdown'
#gem 'wikicloth'

#
# Testing-Gems
# 
gem "rspec-rails", :group => [:test, :development]
gem "fabrication", :group => [:test, :development]
gem "capybara", :group => [:test]
gem "faker", :group => [:test], :require => "faker"

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# ActAsTaggable
gem 'acts-as-taggable-on', '~> 2.4.1'
gem 'formtastic'
gem 'formtastic-bootstrap'
gem "breadcrumbs_on_rails"

# jquery
gem "jquery-rails", "~> 3.0.4"
gem "jquery-ui-rails"

# moustache for templating
gem 'mustache-js-rails'
gem 'momentjs-rails'
