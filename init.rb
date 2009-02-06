require File.dirname(__FILE__) + '/lib/happy_titles'
ActionView::Base.send(:include, HappyTitles)
ActionView::Base.send(:cattr_accessor, :happy_title_settings)