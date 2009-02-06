module HappyTitles
  
  @@happy_title_settings = {
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