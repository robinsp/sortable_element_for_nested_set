ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/railsenv/config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.mock_with :mocha
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

require File.expand_path(File.dirname(__FILE__) + "/../lib/sortable_element_for_nested_set")
require File.expand_path(File.dirname(__FILE__) + "/../lib/sortable_element_for_nested_set_helper")

