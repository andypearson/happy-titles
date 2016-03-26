# frozen_string_literal: true
module HappyTitles
  class TemplateSet
    def initialize(*templates)
      @templates = templates
    end

    def get(key)
      find_template(key) || raise_template_not_found(key)
    end

    private

    attr_accessor :templates

    def method_missing(*args)
      delete_template(args[0])
      templates << HappyTitles::Template.new(
        name: args[0],
        without_title: args[1],
        with_title: args[2]
      )
    end

    def find_template(key)
      templates.find do |template|
        template.name == key.to_sym
      end
    end

    def delete_template(key)
      templates.reject! do |template|
        template.name == key.to_sym
      end
    end

    def raise_template_not_found(key)
      raise(
        HappyTitles::TemplateNotFound,
        "A template called \"#{key}\" could not be found. Templates that exist are: #{template_names}"
      )
    end

    def template_names
      @templates.collect(&:name).join(", ")
    end
  end
end
