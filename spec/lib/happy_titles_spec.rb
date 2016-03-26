describe HappyTitles do
  subject { described_class }

  describe '.config' do
    it 'returns a config object' do
      expect(subject.config).to be_a(subject::Config)
    end

    it 'always returns the same config object' do
      expect(subject.config).to equal(subject.config)
    end
  end

  describe ".configure" do
    it "yields the config object" do
      expect { |b| subject.configure(&b) }.to yield_with_args(subject.config)
    end
  end

  # DRAGONS BELOW

  # before do
  #   @view = ActionView::Base.new
  # end
  #
  # after do
  # end
  #
  # describe 'custom settings' do
  #
  #   describe 'templates' do
  #
  #     before do
  #       @default_templates = ActionView::Base.happy_title_settings[:templates].dup
  #     end
  #
  #     after do
  #       ActionView::Base.happy_title_settings[:templates] = @default_templates
  #     end
  #
  #     it 'should be able to change the default templates' do
  #       ActionView::Base.happy_title_template(:default, '[:site] :title', ':title at :site')
  #       expect(ActionView::Base.happy_title_settings[:templates][:default]).to eq(['[:site] :title', ':title at :site'])
  #     end
  #
  #     it 'should be able to add a new template' do
  #       ActionView::Base.happy_title_template(:new_template, '[:site] :title', ':title at :site')
  #       expect(ActionView::Base.happy_title_settings[:templates][:new_template]).to eq(['[:site] :title', ':title at :site'])
  #     end
  #
  #     it 'should be able to add a new template with one format' do
  #       ActionView::Base.happy_title_template(:new_template, '[:site] :title')
  #       expect(ActionView::Base.happy_title_settings[:templates][:new_template]).to eq(['[:site] :title'])
  #     end
  #
  #   end
  #
  # end
  #
  # describe 'setting the title' do
  #
  #   it 'should set the title' do
  #     @view.title("Happy Title!")
  #     expect(@view.page_title).to eq("Happy Title!")
  #   end
  #
  #   it 'should overwrite a privously set title' do
  #     @view.title('First Page Title')
  #     @view.title('Second Page Title')
  #     expect(@view.page_title).to eq("Second Page Title")
  #   end
  #
  #   it 'should strip HTML elements from the title' do
  #     @view.title('<strong>Cat is</strong>!')
  #     expect(@view.page_title).to eq('Cat is!')
  #   end
  #
  #   it 'should escape special entities in the title element' do
  #     @view.title('This & That')
  #     expect(@view.page_title).to eq('This &amp; That')
  #   end
  #
  #   it 'should handle a mix of HTML and special entities' do
  #     @view.title('<strong>This & That</strong>')
  #     expect(@view.page_title).to eq('This &amp; That')
  #   end
  #
  # end
  #
  # describe 'setting the title with a hash' do
  #
  #   it 'should overwite the title' do
  #     @view.title(:title => 'My page title')
  #     expect(@view.happy_title).to have_tag('title', 'My page title | My Site')
  #   end
  #
  #   it 'should overwrite the site' do
  #     @view.title(:site => 'Overridden Site')
  #     expect(@view.happy_title).to have_tag('title', 'Overridden Site | My short, descriptive and witty tagline')
  #   end
  #
  #   it 'should not overwrite the site if the provided value is blank' do
  #     @view.title(:site => '')
  #     expect(@view.happy_title).to have_tag('title', 'My Site | My short, descriptive and witty tagline')
  #   end
  #
  #   it 'should overwrite the tagline' do
  #     @view.title(:tagline => 'Overridden Tagline')
  #     expect(@view.happy_title).to have_tag('title', 'My Site | Overridden Tagline')
  #   end
  #
  #   it 'should not overwrite the tagline if the provided value is blank' do
  #     @view.title(:tagline => '')
  #     expect(@view.happy_title).to have_tag('title', 'My Site | My short, descriptive and witty tagline')
  #   end
  #
  #   it 'should overwrite the template' do
  #     @view.title(:template => '[[:site]] -- :title')
  #     expect(@view.happy_title).to have_tag('title', '[[My Site]] -- My short, descriptive and witty tagline')
  #   end
  #
  #   it 'should not overwrite the template if the provided value is blank' do
  #     @view.title(:template => '')
  #     expect(@view.happy_title).to have_tag('title', 'My Site | My short, descriptive and witty tagline')
  #   end
  #
  #   it 'should allow you to set the title seperatly' do
  #     @view.title('Custom page title', :site => 'Overridden Tagline')
  #     expect(@view.happy_title).to have_tag('title', 'Custom page title | Overridden Tagline')
  #   end
  #
  # end
  #
  # describe 'procs as settings' do
  #
  #   it 'should allow a proc for the site name and tagline' do
  #     @view.title(:site => Proc.new { "Site Number #{2 + 2}" }, :tagline => Proc.new { "Tagline Number #{12 - 8}" })
  #     expect(@view.happy_title).to have_tag('title', 'Site Number 4 | Tagline Number 4')
  #   end
  #
  #   it 'should allow a proc for the site name and tagline from settings' do
  #     ActionView::Base.happy_title_setting(:site, Proc.new { "Site Number #{3 + 3}" })
  #     ActionView::Base.happy_title_setting(:tagline, Proc.new { "Tagline Number #{10 - 4}" })
  #     expect(@view.happy_title).to have_tag('title', 'Site Number 6 | Tagline Number 6')
  #   end
  #
  # end
  #
  # describe 'reading the title method' do
  #
  #   it 'should return an empty string when called with no args' do
  #     expect(@view.title).to eq('')
  #   end
  #
  #   it 'should return @page_title when @page_title is set and is called with no args' do
  #     @view.title('Happy Title!')
  #     expect(@view.title).to eq('Happy Title!')
  #   end
  #
  #   it 'should not set the title when called with no args' do
  #     @view.title
  #     expect(@view.happy_title).to have_tag('title', 'My Site | My short, descriptive and witty tagline')
  #   end
  #
  # end
  #
  # describe 'showing the title' do
  #
  #   it 'should output a valid title element' do
  #     expect(@view.happy_title).to have_tag('title')
  #   end
  #
  #   describe 'with default settings' do
  #
  #     it 'should use the default template when the page title is not set' do
  #       expect(@view.happy_title).to have_tag('title', 'My Site | My short, descriptive and witty tagline')
  #     end
  #
  #     it 'should use the default template when the page title is set' do
  #       @view.title('Example Page Title')
  #       expect(@view.happy_title).to have_tag('title', 'Example Page Title | My Site')
  #     end
  #
  #   end
  #
  #   describe 'with custom settings' do
  #
  #     before do
  #       @default_site = ActionView::Base.happy_title_settings[:site].dup
  #       @default_tagline = ActionView::Base.happy_title_settings[:tagline].dup
  #     end
  #
  #     after do
  #       ActionView::Base.happy_title_setting(:site, @default_site)
  #       ActionView::Base.happy_title_setting(:tagline, @default_tagline)
  #     end
  #
  #     it 'should render the title with a custom site' do
  #       ActionView::Base.happy_title_setting(:site, 'Custom Site')
  #       expect(@view.happy_title).to have_tag('title', 'Custom Site | My short, descriptive and witty tagline')
  #     end
  #
  #     it 'should render the title with a custom tagline' do
  #       ActionView::Base.happy_title_setting(:tagline, 'My custom tagline...')
  #       expect(@view.happy_title).to have_tag('title', 'My Site | My custom tagline...')
  #     end
  #
  #     describe '(templates)' do
  #
  #       before do
  #         @default_templates = ActionView::Base.happy_title_settings[:templates].dup
  #       end
  #
  #       after do
  #         ActionView::Base.happy_title_settings[:templates] = @default_templates
  #       end
  #
  #       describe 'template with a single format' do
  #
  #         before do
  #           ActionView::Base.happy_title_template(:default, '[:site] :title')
  #         end
  #
  #         it 'should render the template when the title is not set' do
  #           expect(@view.happy_title).to have_tag('title', '[My Site] My short, descriptive and witty tagline')
  #         end
  #
  #         it 'should render the template when the title is set' do
  #           @view.title('Another example title')
  #           expect(@view.happy_title).to have_tag('title', '[My Site] Another example title')
  #         end
  #
  #       end
  #
  #       describe 'template with two formats' do
  #
  #         before do
  #           ActionView::Base.happy_title_template(:default, '[:site] :title', ':title at :site')
  #         end
  #
  #         it 'should render the template when the title is not set' do
  #           expect(@view.happy_title).to have_tag('title', '[My Site] My short, descriptive and witty tagline')
  #         end
  #
  #         it 'should render the alternate template when the title is set' do
  #           @view.title('Would of thought these titles would of got a bit funnier by now')
  #           expect(@view.happy_title).to have_tag('title', 'Would of thought these titles would of got a bit funnier by now at My Site')
  #         end
  #       end
  #
  #       describe 'using a custom template' do
  #
  #         before do
  #           ActionView::Base.happy_title_template(:custom, '++:site++', ':title ++:site++')
  #         end
  #
  #         it 'should render a custom template when the title is not set' do
  #           expect(@view.happy_title(:custom)).to have_tag('title', '++My Site++')
  #         end
  #
  #         it 'should render a custom template when the title is not set' do
  #           @view.title('Fraid not, I got nothing')
  #           expect(@view.happy_title(:custom)).to have_tag('title', 'Fraid not, I got nothing ++My Site++')
  #         end
  #
  #       end
  #
  #     end
  #
  #   end
  #
  # end

end
