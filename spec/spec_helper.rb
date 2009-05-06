require 'rubygems'
require 'active_support'
require 'spec/autorun'
require 'shoulda'
require File.join(File.dirname(__FILE__), '../lib/time_with_granularity')

Time.zone = 'UTC'

Spec::Runner.configure do |config|
  
end