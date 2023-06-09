source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootsnap', '>= 1.4.4', require: false

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Sidekiq
gem "sidekiq", "~> 7.0"
gem "sidekiq-cron", "~> 1.9"

gem "twilio-ruby", "~> 5.74"
gem "root_domain", "~> 0.1.2"

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'
gem "cpf_cnpj", "~> 0.5.0"
gem "validators", "~> 3.4"

gem "ransack", "~> 4.0"
gem "will_paginate", "~> 3.3"

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', '~> 3.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop-rails', '~> 2.18', require: false
  gem 'bundle-audit', '~> 0.1.0', require: false
  gem 'rails_best_practices', '~> 1.23', require: false
  gem 'annotate', '~> 3.2'
end

group :test do
  gem 'rspec-rails', '~> 6.0'
  gem 'capybara', '~> 3.38'
  gem 'selenium-webdriver', '~> 4.8'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'simplecov', '~> 0.22.0', require: false
end
