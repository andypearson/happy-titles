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
      ActionView::Base.happy_title_settings.should be_a(Hash)
    end
    
    it 'should respond to happy_title helper' do
      @view.should respond_to(:happy_title)
    end
    
    it 'should respond to title helper' do
      @view.should respond_to(:title)
    end
    
  end
  
  describe 'default settings' do
    
    it 'should have a default site setting' do
      ActionView::Base.happy_title_settings[:site].should == 'My Site'
    end
    it 'should have a default tagline setting' do
      ActionView::Base.happy_title_settings[:tagline].should == 'My short, descriptive and witty tagline'
    end
    
    describe 'templates' do
      
      it 'should have a list of templates' do
        ActionView::Base.happy_title_settings[:templates].should be_a(Hash)
      end
      
      it 'should have a default template' do
        ActionView::Base.happy_title_settings[:templates][:default].should be_an(Array)
      end
      
      it 'should have a default template for when the page title is not set' do
        ActionView::Base.happy_title_settings[:templates][:default][0].should == '%s | %l'
      end
      
      it 'should have a default template for when the page title is set' do
        ActionView::Base.happy_title_settings[:templates][:default][1].should == '%t | %s'
      end
      
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