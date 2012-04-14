source 'https://rubygems.org'
require 'socket'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', :group => :production

if(Socket.gethostname != 'fernando-dell')
	gem 'mysql2', :group => :development
end

gem 'devise'
gem 'letter_opener', :group => :development
gem 'simple_form' 
gem 'will_paginate'
gem 'thin'
gem 'carrierwave'
gem 'fog'
gem 'cocoon'
gem 'exception_notification'
gem 'delayed_job_active_record'
gem "delayed_job_web"
gem "daemons"


gem 'rest-client', :group => :test

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :development, :test do
  gem 'factory_girl_rails'
#  gem 'turn', :require => false
end

group :development do
	gem 'sqlite3'
end

#Dropbox integration
gem 'dropbox-sdk'
