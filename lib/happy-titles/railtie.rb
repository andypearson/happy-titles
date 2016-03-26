# frozen_string_literal: true
require "happy-titles"
require "rails"

module HappyTitles
  class Railtie < Rails::Railtie
    initializer "happy-titles.initialize" do
      ActionView::Base.send :include, HappyTitles::Helpers
    end
  end
end
