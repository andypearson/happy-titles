require File.dirname(__FILE__) + '/spec_helper'

describe 'Happy Titles!' do
  
  before do
    @view = ActionView::Base.new
  end
  
  describe 'after loading the plugin' do
    
    it "should be mixed into ActionView::Base" do
      ActionView::Base.included_modules.include?(HappyTitles).should be_true
    end
    
    it 'should respond to happy_title_settings class variable' do
      puts ActionView::Base.happy_title_settings
    end
    
    it 'should respond to happy_title helper' do
      @view.should respond_to(:happy_title)
    end
    
    it 'should respond to title helper' do
      @view.should respond_to(:title)
    end
    
  end
  
  describe 'setting the title' do
    
    it 'should set the title' do
      @view.title("Happy Title!").should eql("Happy Title!")
    end
    
  end
  
  describe 'showing the title' do
    
    it 'should output a valid title element' do
      @view.happy_title.should have_tag('title')
    end
  
  end
  
end