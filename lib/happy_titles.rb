module HappyTitles
  
  @@happy_title_settings = {
    :site => 'My Site',
    :tagline => 'My short, descriptive and witty tagline',
    :templates => {
      :default => ['%s | %l', '%t | %s']
    }
  }
  
  def happy_title
    '<title>'+'</title>'
  end
  
  def title(page_title)
    @page_title = page_title
  end
  
end