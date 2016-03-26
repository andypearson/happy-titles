# frozen_string_literal: true
module HappyTitles
  class Config
    attr_accessor :site, :tagline

    def initialize
      @site = DEFAULT_SITE
      @tagline = DEFAULT_TAGLINE
      @template_set = HappyTitles::TemplateSet.new(default_template)
    end

    def template(key = :default)
      template_set.get(key)
    end

    def templates(&block)
      template_set.instance_eval(&block)
    end

    private

    DEFAULT_SITE = "My site"
    DEFAULT_TAGLINE = "My short, descriptive and witty tagline"

    DEFAULT_TEMPLATE_OPTIONS = {
      name: :default,
      with_title: ":title | :site",
      without_title: ":site | :tagline"
    }.freeze

    attr_reader :template_set

    def default_template
      HappyTitles::Template.new(**DEFAULT_TEMPLATE_OPTIONS)
    end
  end
end
