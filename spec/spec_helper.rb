# coding: utf-8
require 'rubygems'

gem 'activesupport', '~> 3.0'
gem 'actionpack', '~> 3.0'
require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'

gem 'rspec', '~> 2.5'
gem 'rspec-rails', '~> 2.5'
gem 'hpricot', '>= 0.6.1'
gem 'rspec_tag_matchers', '>= 1.0.0'
require 'rspec_tag_matchers'

require File.join(File.dirname(__FILE__), "../lib/happy-titles")

RSpec.configure do |config|
  config.include(RspecTagMatchers)
end

ActionView::Base.class_eval do
  include HappyTitles
end