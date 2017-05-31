require 'bundler'
Bundler.require
require 'rest-client'
require 'json'
require 'pry'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
#old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger.level = 1
require_all 'lib'
