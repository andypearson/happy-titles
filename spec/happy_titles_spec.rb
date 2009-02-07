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
    
    it 'should respond to happy_title_template class method' do
      ActionView::Base.should respond_to(:happy_title_template)
    end
    
    it 'should respond to happy_title_setting class method' do
      ActionView::Base.should respond_to(:happy_title_setting)
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
        ActionView::Base.happy_title_settings[:templates][:default][0].should == ':site | :title'
      end
      
      it 'should have a default template for when the page title is set' do
        ActionView::Base.happy_title_settings[:templates][:default][1].should == ':title | :site'
      end
      
    end
    
  end
  
  describe 'custom settings' do
    
    before do
      @default_site = ActionView::Base.happy_title_settings[:site].dup
      @default_tagline = ActionView::Base.happy_title_settings[:tagline].dup
    end
    
    after do
      ActionView::Base.happy_title_setting(:site, @default_site)
      ActionView::Base.happy_title_setting(:tagline, @default_tagline)
    end
    
    it 'should be able to change the default site' do
      ActionView::Base.happy_title_setting(:site, 'My Custom Site')
      ActionView::Base.happy_title_settings[:site].should == 'My Custom Site'
    end
    
    it 'should be able to change the default tagline' do
      ActionView::Base.happy_title_setting(:tagline, 'My very custom tagline')
      ActionView::Base.happy_title_settings[:tagline].should == 'My very custom tagline'
    end
    
    describe 'templates' do
      
      before do
        @default_templates = ActionView::Base.happy_title_settings[:templates].dup
      end
      
      after do
        ActionView::Base.happy_title_settings[:templates] = @default_templates
      end
      
      it 'should be able to change the default templates' do
        ActionView::Base.happy_title_template(:default, '[:site] :title', ':title at :site')
        ActionView::Base.happy_title_settings[:templates][:default].should == ['[:site] :title', ':title at :site']
      end
      
      it 'should be able to add a new template' do
        ActionView::Base.happy_title_template(:new_template, '[:site] :title', ':title at :site')
        ActionView::Base.happy_title_settings[:templates][:new_template].should == ['[:site] :title', ':title at :site']
      end
      
      it 'should be able to add a new template with one format' do
        ActionView::Base.happy_title_template(:new_template, '[:site] :title')
        ActionView::Base.happy_title_settings[:templates][:new_template].should == ['[:site] :title']
      end
      
    end
    
  end
  
  describe 'setting the title' do
    
    it 'should set the title' do
      @view.title("Happy Title!")
      @view.send(:page_title).should eql("Happy Title!")
    end
    
    it 'should overwrite a privously set title' do
      @view.title('First Page Title')
      @view.title('Second Page Title')
      @view.page_title.should eql("Second Page Title")
    end
    
    it 'should strip HTML elements from the title' do
      @view.title('<strong>Cat is</strong>!')
      @view.page_title.should eql('Cat is!')
    end

    it 'should escape special entities in the title element' do
      @view.title('This & That')
      @view.page_title.should eql('This &amp; That')
    end
    
    it 'should handle a mix of HTML and special entities' do
      @view.title('<strong>This & That</strong>')
      @view.page_title.should eql('This &amp; That')
    end
    
  end
  
  describe 'showing the title' do
    
    it 'should output a valid title element' do
      @view.happy_title.should have_tag('title')
    end
    
    describe 'with default settings' do
      
      it 'should use the default template when the page title is not set' do
        @view.happy_title.should have_tag('title', 'My Site | My short, descriptive and witty tagline')
      end
      
      it 'should use the default template when the page title is set' do
        @view.title('Example Page Title')
        @view.happy_title.should have_tag('title', 'Example Page Title | My Site')
      end
      
    end
    
    describe 'with custom settings' do
      
      before do
        @default_site = ActionView::Base.happy_title_settings[:site].dup
        @default_tagline = ActionView::Base.happy_title_settings[:tagline].dup
      end
      
      after do
        ActionView::Base.happy_title_setting(:site, @default_site)
        ActionView::Base.happy_title_setting(:tagline, @default_tagline)
      end
      
      it 'should render the title with a custom site' do
        ActionView::Base.happy_title_setting(:site, 'Custom Site')
        @view.happy_title.should have_tag('title', 'Custom Site | My short, descriptive and witty tagline')
      end
      
      it 'should render the title with a custom tagline' do
        ActionView::Base.happy_title_setting(:tagline, 'My custom tagline...')
        @view.happy_title.should have_tag('title', 'My Site | My custom tagline...')
      end
      
      describe '(templates)' do
        
        before do
          @default_templates = ActionView::Base.happy_title_settings[:templates].dup
        end

        after do
          ActionView::Base.happy_title_settings[:templates] = @default_templates
        end
        
        describe 'template with a single format' do
          
          before do
            ActionView::Base.happy_title_template(:default, '[:site] :title')
          end
          
          it 'should render the template when the title is not set' do
            @view.happy_title.should have_tag('title', '[My Site] My short, descriptive and witty tagline')
          end
          
          it 'should render the template when the title is set' do
            @view.title('Another example title')
            @view.happy_title.should have_tag('title', '[My Site] Another example title')
          end
          
        end
        
        describe 'template with two formats' do
          it 'should render the template when the title is not set'
          it 'should render the alternate template when the title is set'
        end
        
        describe 'using a custom template' do
          it 'should use the custom template to render the title'
        end
        
      end
      
    end
    
  end
  
end