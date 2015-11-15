source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'dotenv-rails', '~> 2.0', '>= 2.0.2'
gem 'faraday', '~> 0.9.2'
gem 'foundation-rails', '~> 5.5', '>= 5.5.3.2'
gem 'haml-rails', '~> 0.9.0'

group :production do
  gem 'passenger', '~> 5.0', '>= 5.0.21'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development do
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'guard', '~> 2.13'
  gem 'guard-rspec', '~> 4.6', '>= 4.6.4'
  gem 'quiet_assets', '~> 1.1'
end

group :development, :test do
  gem 'awesome_print', '~> 1.6', '>= 1.6.1'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rspec-rails', '~> 3.4'
end

group :test do
  gem 'timecop', '~> 0.8.0'
  gem 'vcr', '~> 3.0'
  gem 'webmock', '~> 1.22', '>= 1.22.3'
end
