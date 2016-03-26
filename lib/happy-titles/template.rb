# frozen_string_literal: true
module HappyTitles
  class Template
    attr_reader :name

    def initialize(name:, without_title:, with_title:)
      @name = name.to_sym
      @with_title = with_title
      @without_title = without_title
    end

    def render(title:, tagline:, site:)
      template = (title && with_title) ? with_title : without_title
      substitute_placeholders(
        template,
        title: title || tagline,
        tagline: tagline,
        site: site
      )
    end

    private

    attr_reader :with_title, :without_title

    def substitute_placeholders(template, options)
      options.each do |key, value|
        template = template.gsub(":#{key}", value.to_s)
      end
      template
    end
  end
end
