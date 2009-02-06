require 'rubygems'
require 'spec'
require 'activesupport'
require 'active_support'
require 'actionpack'
require 'action_controller'
require 'action_view'
require 'rspec_hpricot_matchers'
require File.join(File.dirname(__FILE__), "../lib/happy_titles")

Spec::Runner.configure do |config|
  config.include(RspecHpricotMatchers)
end

ActionView::Base.class_eval do
  include HappyTitles
end