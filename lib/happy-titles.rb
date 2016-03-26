require 'happy-titles/railtie' if defined?(::Rails::Railtie)

require 'happy-titles/config'
require 'happy-titles/helpers'
require 'happy-titles/template'

module HappyTitles
  class TemplateNotFound < StandardError; end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end

  # DRAGONS BELOW

  attr_accessor :page_title

  @@happy_title_settings = {
    :site => 'My Site',
    :tagline => 'My short, descriptive and witty tagline',
    :templates => {
      :default => [':site | :title', ':title | :site']
    }
  }

  def happy_title(template_key = :default)
    content_tag(:title, render_title_template(template_key))
  end

  def title(page_title = nil, settings = {})

    if page_title && page_title.is_a?(Hash)
      settings = page_title
      page_title = settings[:title] ? settings[:title] : nil
    end

    @happy_title_settings = settings
    if page_title
      @page_title = h(page_title.gsub(/<\/?[^>]*>/, '')) if page_title
    else
      @page_title || ''
    end

  end

  def self.included(base)
    base.class_eval do

      cattr_accessor :happy_title_settings

      def self.happy_title_template(template_key, format, additional_format = nil)
        template = [format]
        template << additional_format if additional_format
        @@happy_title_settings[:templates][template_key] = template
      end

      def self.happy_title_setting(key, value)
        @@happy_title_settings[key] = value
      end

    end
  end

  private

    def render_title_template(template_key)
      key = (@page_title && @@happy_title_settings[:templates][template_key][1]) ? 1 : 0
      template = read_happy_title_setting(:template) ? read_happy_title_setting(:template) : @@happy_title_settings[:templates][template_key][key]
      substitute_placeholders(template)
    end

    def substitute_placeholders(template)
      title = template
      title = title.gsub(':title', title_text)
      title = title.gsub(':site', read_happy_title_setting(:site))
      title = title.gsub(':tagline', read_happy_title_setting(:tagline))
    end

    def read_happy_title_setting(key)
      setting = @@happy_title_settings[key]
      setting = @happy_title_settings[key] if @happy_title_settings && !@happy_title_settings[key].blank?
      setting = setting.call if setting.is_a?(Proc)
      setting
    end

    def title_text
      (@page_title) ? @page_title : read_happy_title_setting(:tagline)
    end

end
