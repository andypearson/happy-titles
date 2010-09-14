require 'happy-titles'
require 'rails'

module HappyTitles
  class Railtie < Rails::Railtie
    initializer 'happy-titles.initialize', :after => :after_initialize do
      ActionView::Base.send :include, HappyTitles
    end
  end
end