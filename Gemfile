source 'https://rubygems.org'
ruby "2.2.4"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '>= 5.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bcrypt'
gem 'active_model_serializers', '0.9.0'
gem 'foundation-rails', '5.4.5'
gem 'rails_admin'
gem 'cancan'
gem 'bower-rails'
# will_paginate gem is break rails_admin
# gem 'will_paginate'
gem 'draper', '1.4.0'
gem 'react-rails', '~> 1.4.0'
gem 'rails_12factor'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'awesome_print'
gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '< 2.0'

gem 'premailer-rails'
gem 'nokogiri'

gem 'haml'
gem "haml-rails", "~> 0.9"

gem 'gibbon'

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'rails-assets-tether', source: 'https://rails-assets.org'

gem 'sitemap_generator'

group :development do
  gem 'annotate'
  gem 'pry'
  gem 'letter_opener'
end

group :test do
  gem 'faker'
end

group :test, :development do
  gem 'byebug'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :production do
  gem 'unicorn'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
