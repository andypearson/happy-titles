module HappyTitles
  
  @@happy_title_settings = {
    :site => 'My Site',
    :tagline => 'My short, descriptive and witty tagline',
    :templates => {
      :default => ['%s | %l', '%t | %s']
    }
  }
  
  def happy_title(template_key = :default)
    content_tag(:title, render_title_template(template_key))
  end
  
  def title(page_title)
    @page_title = page_title
  end
  
  private
    
    def render_title_template(template_key)
      key = (@page_title) ? 1 : 0
      substitute_placeholders(@@happy_title_settings[:templates][template_key][key])
    end
    
    def substitute_placeholders(template)
      title = template.gsub('%s', @@happy_title_settings[:site])
      title = title.gsub('%l', @@happy_title_settings[:tagline])
      title = title.gsub('%t', @page_title) if @page_title
      title
    end
    
end