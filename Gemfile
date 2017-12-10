source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.0.3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'yui-compressor'
gem 'compass-rails', github: 'Compass/compass-rails'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'modernizr-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "paperclip", git: "https://github.com/thoughtbot/paperclip.git"
gem 'access-granted', '~> 1.1.0'
gem "time_splitter"
gem 'will_paginate'
gem 'chosen-rails'
gem 'cocoon'
gem 'trix'
gem 'truncate_html'
gem 'geocoder'
gem 'activeadmin', github: 'activeadmin'

#gems for the emails
gem 'sidekiq'
gem 'inky-rb', require: 'inky'
gem 'premailer-rails' # Stylesheet inlining for email **
gem 'mail_form'
gem 'mailjet', git: 'https://github.com/mailjet/mailjet-gem.git'
#end emails

# locals and languages
gem 'rails-i18n', '~> 5.0.0'
gem 'devise-i18n'
#end locals

#Oauth gems
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
#end Oauth

group :production do
  gem 'aws-sdk', '~> 2.3'
  gem 'exception_notification'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem "letter_opener"
  gem 'capybara-email'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'high_voltage'
gem 'pg'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby

group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
