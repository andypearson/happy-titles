# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{happy-titles}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Pearson"]
  s.date = %q{2010-09-14}
  s.email = %q{andy@andy-pearson.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".git_ignore",
     ".gitignore",
     "MIT-LICENCE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "happy-titles.gemspec",
     "init.rb",
     "lib/happy-titles.rb",
     "lib/happy-titles/railtie.rb",
     "rails/init.rb",
     "spec/happy_titles_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/andypearson/happy-titles}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A simple way to handle page titles in your layouts.}
  s.test_files = [
    "spec/happy_titles_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

