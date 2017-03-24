source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap-slider-rails', '~> 9.2'
gem 'coffee-rails', '~> 4.2'
gem 'evil-blocks-rails', '~> 0.7.0'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'sass-rails', '~> 5.0'
gem 'slim', '~> 3.0'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'

gem 'awesome_print', '~> 1.7'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'has_scope', '~> 0.7.0'
gem 'rubocop', '~> 0.47.1'
gem 'state_machine', '~> 1.2'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'

group :development, :test do
  gem 'byebug', :platform => :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', :platforms => [:mingw, :mswin, :x64_mingw, :jruby]
