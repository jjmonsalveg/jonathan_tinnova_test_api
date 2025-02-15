source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use Faraday as HTTP client
gem 'faraday'

# Use JWT as authenticator
gem 'jwt'

# Use Active Model Serializers
gem 'active_model_serializers', '~> 0.10.0'

# bulk insert
gem 'activerecord-import'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'dotenv-rails', '2.7.5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # A library for generating fake data
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

  # framework for test
  gem 'rspec-rails'

  # generate factories for test
  gem 'factory_bot_rails', '5.1.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # allows to automatically&intelligently launch specs when files are modified
  gem 'guard-rspec','4.7.3', require: false
end

group :test do
  # code coverage
  gem 'simplecov', require: false
  # custom validators
  gem 'shoulda-matchers', '4.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
