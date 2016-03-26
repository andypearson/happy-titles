# frozen_string_literal: true
module HappyTitles
  module Helpers
    def title(title = nil)
      if title
        @happy_titles_page_title = title
      else
        @happy_titles_page_title
      end
    end

    def page_title(key = nil)
      content_tag(:title, render_happy_titles_template(key))
    end

    private

    def render_happy_titles_template(key)
      templete = key ? HappyTitles.config.template(key) : HappyTitles.config.template

      templete.render(
        title: @happy_titles_page_title,
        site: HappyTitles.config.site,
        tagline: HappyTitles.config.tagline
      )
    end
  end
end
