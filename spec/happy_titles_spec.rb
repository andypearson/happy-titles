require File.dirname(__FILE__) + '/spec_helper'
require 'happy_titles'

describe 'Happy Titles!' do
  
  include AndyPearson::HappyTitles
  
  describe '#happy_title' do
    
    it 'should output a title element' do
      happy_title.should have_tag('title')
    end
  
  end
  
end