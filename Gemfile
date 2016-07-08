source 'https://rubygems.org'

ruby '2.3.0'

gem 'bootstrap-sass'
gem 'rails_layout'
gem 'devise'
gem 'simple_form'
gem 'haml-rails'
gem 'has_friendship'
gem 'country_select'
gem 'friendly_id'
gem 'carrierwave'
gem 'mini_magick'
gem 'geocoder'
gem 'kaminari'
gem 'cancan'
gem 'rolify'
gem 'font-awesome-rails'
#gem 'gmap4rails'
gem 'faker'
gem 'sitemap'

gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'rspec-rails', '>= 3.5.0.beta1'
gem 'ransack',    github: 'activerecord-hackery/ransack'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'draper',     github: 'audionerd/draper', branch: 'rails5'
# To fix a Draper deprecation error
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
# Optional -- only if you already include these gems
gem 'rack-mini-profiler',          github: 'MiniProfiler/rack-mini-profiler'
gem 'database_cleaner',            github: 'pschambacher/database_cleaner', branch: 'rails5.0'

gem 'activeadmin', '~> 1.0.0.pre4'
# Added postgres and it production only
gem 'pg', group: :production
gem 'rails_12factor'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
