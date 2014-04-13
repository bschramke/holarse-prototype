source 'https://rubygems.org'

gem 'rails', '4.1.0'

gem 'json'
gem 'stringex'
gem "mechanize"
gem 'safe_attributes'
gem 'searchkick'

gem 'puma' # multithread webserver
gem 'dalli' # memcache
gem 'connection_pool'

# Database backend
platforms :jruby do
#  gem 'activerecord-jdbcsqlite3-adapter', "~> 1.3.3", :require => 'arjdbc/sqlite3'
#  gem 'jdbc-sqlite3'
  gem 'activerecord-jdbcmysql-adapter', "~> 1.3.3", :require => "arjdbc/mysql"
  gem 'jdbc-mysql', "~> 5.1.25" # fuer datenmigration von mysql
end

platforms :ruby do
  gem "sqlite3"
end

# dateianhaenge
gem 'paperclip', "~> 3.0"
# model decoration
gem 'draper', '~> 1.3.0'

gem 'sass-rails',   '~> 4.0.1'
gem 'haml-rails', '~> 0.5.3'

gem 'friendly_id', '~> 5.0.3'

# View
# 
gem 'kramdown'
#gem 'wikicloth'
gem 'font-awesome-rails'

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
gem 'acts-as-taggable-on', '~> 3.0.2'
gem 'formtastic', '~> 2.3.0rc'
gem 'formtastic-bootstrap'
gem "breadcrumbs_on_rails"

gem 'ruby-progressbar'
