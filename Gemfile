source 'https://rubygems.org'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'devise'
gem 'slim'
gem 'active_model_serializers'

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate'
end

group :test do
  gem 'faker'
end

group :test, :development do
  gem 'byebug'
  gem 'capybara'
  gem 'rspec-rails'
end

group :production do
  gem 'unicorn'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc