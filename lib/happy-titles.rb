require 'happy-titles/railtie' if defined?(::Rails::Railtie)

require 'happy-titles/config'
require 'happy-titles/helpers'
require 'happy-titles/template'
require 'happy-titles/template_set'

module HappyTitles
  class TemplateNotFound < StandardError; end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
