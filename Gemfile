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

gem 'rabl', '~> 0.11.6'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'pry-rails', '~> 0.3.4' #enhanced ruby console

gem 'kaminari', '~> 0.16.3' #used for backend paginations
gem 'api-pagination', '~> 4.1.1' #api pagination

gem 'elasticsearch-model'
gem 'elasticsearch-rails'

gem 'materialize-sass', '~> 0.98.2' #materialize css based on material design

gem 'geocoder', '~> 1.4', '>= 1.4.4'
gem 'countries', '~> 1.1.0' #get all the countries codes and names
gem 'dotenv-rails', '~> 2.0'

gem 'web-console', '~> 2.0', group: :development
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  gem 'spring'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'cucumber-rails', '~> 1.4', '>= 1.4.3'
  gem 'selenium-webdriver', '~> 3.13'
  gem 'guard-rspec'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
end