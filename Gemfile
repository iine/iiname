source 'https://rubygems.org'

ruby "2.2.3"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# User web service api
gem 'rakuten_web_service'
gem 'google-search'
gem "faraday"

gem 'quiet_assets'
gem 'less-rails'
gem 'execjs'
gem 'bootstrap-sass'
gem 'therubyracer', platforms: :ruby
gem 'html5_validators'
gem 'settingslogic'
gem 'rails-flog', :require => 'flog'
gem 'dotenv'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem "i18n-js"
gem 'active_decorator'

gem 'airbrake'
gem 'newrelic_rpm'
gem "rack-contrib", require: "rack/contrib"

gem "addressable"

# 形態素解析
gem "okura"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'style-guide'
  gem "rack-livereload"
  gem "guard-livereload"
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-coolline'
  gem 'pry-byebug'
  gem 'sqlite3'
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rails-footnotes', github: 'josevalim/rails-footnotes'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'rvt'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'rack-mini-profiler'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'puma'
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :test do
  gem 'factory_girl', '~> 4.5'
  gem 'factory_girl_rails'
  gem "simplecov", require: false
  gem 'capybara'
  gem "capybara-webkit"
  gem 'poltergeist'
  gem 'launchy'
  gem 'spring'
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-rails'
  gem 'minitest-spec-rails'
  gem 'terminal-notifier-guard'
  gem 'childprocess'
  gem 'database_cleaner'
  gem 'turnip'
  gem "webmock"
  gem "mocha"
end

group :production, :staging do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
end
