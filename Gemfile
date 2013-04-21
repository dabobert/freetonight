source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem "less", "~> 2.3.1"
gem "will_paginate", "~> 3.0.4" #does pagination
gem "devise", "~> 2.2.3" #user authentication
gem 'carmen-rails', '~> 1.0.0.beta3' #provides geographic data and country_select and subregion_select form helpers.
gem "mysql2", "~> 0.3.11"

#date stuff
gem "ice_cube", "~> 0.10.0" #date recurrence
#gem "holidays", "~> 1.0.5"
#gem "business_time", "~> 0.6.1"

group :assets do
  #gem "less", "~> 2.3.1"
  gem 'sass-rails',   '~> 3.2.3'
  
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'jquery-ui-rails'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "random_data", "~> 1.6.0" #allows to easily create random date, like Random.email or Random.last
  gem "debugger", "~> 1.3.1"
  gem "better_errors", "~> 0.7.2" #rails error pages actually provide useful
  gem "binding_of_caller", "~> 0.7.1" #intergrates debugger into better errors page
end