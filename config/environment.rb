# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.load_paths += %W( #{RAILS_ROOT}/app/presenters #{RAILS_ROOT}/app/middleware )
  config.gem 'haml'
  config.gem 'clearance', :source => 'http://gemcutter.org'
  config.gem 'paperclip', :source => 'http://gemcutter.org'
  config.gem 'will_paginate', :source => 'http://gemcutter.org'
  config.gem 'presentable'
  config.gem 'geokit'
  config.gem 'fastercsv', :lib => false
  config.gem 'thinking-sphinx', :lib => 'thinking_sphinx'
  config.time_zone = 'UTC'
end

DO_NOT_REPLY = "donotreply@example.com"
