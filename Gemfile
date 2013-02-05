if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end


source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "mysql2"
gem "json"
gem "capistrano"
gem "sorcery"
gem "cancan"
gem "haml-rails", :git => "git://github.com/rswolff/haml-rails.git"
gem "kaminari"
gem "prawn"
gem "state_machine"
gem "whenever"
gem "money-rails"
gem "chronic"
gem "redcarpet"
group :development do
  gem "pry"
  gem "meta_request", "0.2.1"
  gem "thin"
end

group :production do
  gem "execjs"
  gem "therubyracer"
end
