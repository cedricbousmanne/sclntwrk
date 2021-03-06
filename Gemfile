source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.0.0'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '3.1.0'
gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass',                  '>= 3.0.0.0'
gem 'cancan',                          '1.6.10'
gem 'devise',                          '3.2.2'
gem 'devise_invitable',                '1.3.4', git: "git@github.com:cedricbousmanne/devise_invitable.git", branch: "french-translation", ref: "872cc22"
# gem 'devise_invitable',                path: "/Users/cedric/Code/devise_invitable", branch: "french-translation"
gem 'figaro',                          '0.7.0'
gem 'haml-rails',                      '0.5.3'
gem 'mysql2',                          '0.3.15'
gem 'rolify',                          '3.4.0'
gem 'simple_form',                     '3.0.1'
gem 'simple_hashtag',                  '0.1.9'
gem 'public_activity',                 '1.4.1'
gem 'dragonfly',                       '1.0.3'
gem 'dragonfly-s3_data_store',         '1.0.3'
gem 'unf',                             '0.1.3'
gem 'angular-gem',                     '1.2.1'
gem 'will_paginate',                   '3.0.4', git: "git@github.com:cedricbousmanne/will_paginate.git", branch: "french-translation", ref: "1c5d277998f15df0dd9ceea0fcfa9c7b3e2f1cf7"
gem 'phony_rails',                     '0.6.1'
gem 'roadie',                          '2.4.3'
gem 'premailer-rails',                 '1.7.0'
gem 'nokogiri',                        '1.6.1'
gem 'draper',                          '1.3.0'
gem 'sunspot_rails',                   '2.0.0'
gem 'mailboxer',                       '0.11.0'

# Sidekiq and monitoring

gem 'slim'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'sidekiq',                         '2.12.0'
gem 'sidekiq-scheduler',               '0.5', git: "git@github.com:Moove-it/sidekiq-scheduler.git", ref: "82c392152d4811d38a52763ed5da39019ea7f9dd"

gem 'haml_coffee_assets',      '1.12.0'
gem 'rabl',                    '0.8.6'

gem 'unicorn',                 '4.8.2'
gem 'asset_sync'
gem 'bugsnag'
gem 'customerio'
gem 'rack-cache', require: 'rack/cache'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'bullet'
  gem 'lol_dba'
  gem 'rubocop'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', '~> 0.7.1'
  gem 'sunspot_solr', '2.0.0'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-migrate'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
