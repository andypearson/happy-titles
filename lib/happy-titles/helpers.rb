module HappyTitles::Helpers
  def title(title = nil)
    if title
      @happy_titles_page_title = title
    else
      @happy_titles_page_title
    end
  end

  def page_title
    content_tag(:title, render_title_template)
  end

  private

  def render_title_template
    HappyTitles.config.template.render(
      title: @happy_titles_page_title,
      site: HappyTitles.config.site,
      tagline: HappyTitles.config.tagline,
    )
  end
end
