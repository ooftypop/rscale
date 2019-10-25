source 'https://rubygems.org' # RubyGems.org is the Ruby community’s gem hosting service
ruby '2.6.5' # https://www.ruby-lang.org/en/documentation/

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ==============================================================================
# Frameworks & Core Dependencies ===============================================
# ==============================================================================
gem 'jbuilder', '~> 2.5' # build JSON APIs: https://github.com/rails/jbuilder
gem "pg", "<= 1.1.3" # pg is the Ruby interface to the {PostgreSQL RDBMS}
gem 'puma', '~> 3.11' # A Ruby/Rack web server built for concurrency
gem 'rails', '~> 5.2.3' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

# ==============================================================================
# Languages/Interpreters/Compilers/Compressors =================================
# ==============================================================================
gem 'coffee-rails', '~> 4.2' # CoffeeScript adapter for the Rails asset pipeline
gem 'sass-rails', '~> 5.0' # Ruby on Rails stylesheet engine for Sass
gem 'uglifier', '>= 1.3.0' # Ruby wrapper for UglifyJS JavaScript compressor
# gem 'sqlite3', '~> 1.3', '>= 1.3.6'

# ==============================================================================
# Admin ========================================================================
# ==============================================================================
gem 'bootsnap', '>= 1.1.0', require: false # reduces boot times through caching
gem 'snoop_dogg', '~> 0.1.3' # a nicer way to see models
gem 'turbolinks', '~> 5' # navigate application faster: github.com/turbolinks/turbolinks
gem 'redis', '~> 4.0' # A Ruby client library for Redis
gem 'sidekiq' # Simple, efficient background processing for Ruby http://sidekiq.org
gem 'aws-sdk-s3'
gem "image_processing", "~> 1.0"

# ==============================================================================
# Authentication & Authorization ===============================================
# ==============================================================================
gem "devise", ">= 4.7.1" # flexible authentication solution for Rails with Warden
gem "pundit" # Minimal authorization through OO design and pure Ruby classes
gem "rolify" # Role management library with resource scoping
gem 'devise_invitable', '~> 2.0.0' # An invitation strategy for devise

# ==============================================================================
# Assets =======================================================================
# ==============================================================================
gem 'bootstrap', '~> 4.3.1'
gem "font-awesome-rails" # font-awesome for asset pipeline
gem 'jquery-rails' # automate using jQuery with Rails
gem 'select2-rails' # Integrate Select2 javascript library with Rails asset pipeline https://github.com/argerim/select2-rails
gem 'friendly_id', '~> 5.2.4' # Allows you to create pretty URL’s and work with human-friendly

# ==============================================================================
# Forms ========================================================================
# ==============================================================================
gem "cocoon" # for dynamic nested forms using jQuery
# gem "trix", "~> 0.11.1" # rich text editor for everyday writing


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # a debugger console
  # gem "rails-controller-testing", "~> 1.0.2" # brings back `assigns` and `assert_template` to your Rails tests
  # gem "rspec_junit_formatter", "~> 0.4.1" # RSpec results that your CI can read
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails' # library for setting up Ruby objects as test data
end

group :development do
  gem 'web-console', '>= 3.3.0' # interactive console for exception pages
  gem 'listen', '>= 3.0.5', '< 3.2' # listens to file modifications and notifies you about the changes
  gem 'spring' # Rails application preloader
  gem 'spring-watcher-listen', '~> 2.0.0' # watch filesystem for changes without polling
end

group :test do
  gem 'capybara', '>= 2.15' # test framework for web applications
  gem 'selenium-webdriver' # browser automation framework and ecosystem
  gem 'webdrivers', '~> 3.0'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
