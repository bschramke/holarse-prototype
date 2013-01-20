source 'https://rubygems.org'

gem 'rails', '3.2.10'

gem 'json'

# Database backend
#
platforms :jruby do
    gem 'activerecord-jdbchsqldb-adapter'
    gem 'jdbc-hsqldb', '~> 2.2.9', :require => "jdbc/hsqldb"
    gem 'jdbc-mysql' # fuer datenmigration von mysql
    gem 'jruby-openssl'
end

gem 'paperclip'

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
