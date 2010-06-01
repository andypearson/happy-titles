# coding: utf-8
require 'rubygems'

gem 'activesupport', '2.3.8'
gem 'actionpack', '2.3.8'
require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'

gem 'rspec', '>= 1.2.6'
gem 'rspec-rails', '>= 1.2.6'
gem 'hpricot', '>= 0.6.1'
gem 'rspec_tag_matchers', '>= 1.0.0'
require 'rspec_tag_matchers'

require File.join(File.dirname(__FILE__), "../lib/happy_titles")

Spec::Runner.configure do |config|
  config.include(RspecTagMatchers)
end

ActionView::Base.class_eval do
  include HappyTitles
end