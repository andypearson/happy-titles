class HappyTitles::Config
  attr_accessor :site, :tagline

  def initialize
    @site = DEFAULT_SITE
    @tagline = DEFAULT_TAGLINE
    @templates = [HappyTitles::Template.new(:default)]
  end

  def template(key = :default)
    find_template(key) || raise_template_not_found(key)
  end

  private

  DEFAULT_SITE = "My Site"
  DEFAULT_TAGLINE = "My short, descriptive and witty tagline"

  def find_template(key)
    @templates.find do |template|
      template.name == key.to_sym
    end
  end

  def raise_template_not_found(key)
    raise HappyTitles::TemplateNotFound,
      "A template called \"#{key}\" could not be found. Templates that exist are: #{template_names}"
  end

  def template_names
    @templates.collect(&:name).join(", ")
  end
end
