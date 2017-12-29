source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.4'

gem 'rake', '~> 12.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'faker', '~> 1.6', '>= 1.6.3'

gem 'transitions', '~> 1.2', :require => ["transitions", "active_model/transitions"] # Lightweight state machine extracted from ActiveModel
gem 'pry-rails', '~> 0.3.4' #enhanced ruby console

gem 'elasticsearch-model'
gem 'elasticsearch-rails'

gem 'materialize-sass', '~> 0.98.2' #materialize css based on material design

gem 'geocoder', '~> 1.4', '>= 1.4.4'

gem 'kaminari', '~> 0.16.3' #used for backend paginations
gem 'api-pagination', '~> 4.1.1' #api pagination

group :development, :test do
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
	gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
end