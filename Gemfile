source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.1'
gem 'rails', '~> 5.0.3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "paperclip", git: "https://github.com/thoughtbot/paperclip.git"
gem 'access-granted', '~> 1.1.0'
#gems for the emails
gem 'sidekiq'
gem 'inky-rb', require: 'inky'
gem 'premailer-rails' # Stylesheet inlining for email **
gem 'mailjet', git: 'https://github.com/mailjet/mailjet-gem.git'
#end gems for emails
gem 'will_paginate'
gem 'mail_form'
gem 'truncate_html'
gem 'foundation-icons-sass-rails'

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk', '~> 2.3'
  gem 'exception_notification'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
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
