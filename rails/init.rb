require File.join(File.dirname(__FILE__), *%w[.. lib happy_titles])
ActionView::Base.send(:include, HappyTitles)