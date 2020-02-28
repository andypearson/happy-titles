# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "happy-titles/version"

Gem::Specification.new do |spec|
  spec.name          = "happy-titles"
  spec.version       = HappyTitles::VERSION
  spec.authors       = ["Andy Pearson"]
  spec.email         = ["andy@andy-pearson.com"]
  spec.summary       = "A simple way to handle page titles in your layouts."
  spec.description   = "A simple way to handle page titles in your layouts."
  spec.homepage      = "https://github.com/andypearson/happy-titles"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec-html-matchers", "~> 0.7"
  spec.add_development_dependency "rspec-rails", "~> 3.4"
  spec.add_development_dependency "rubocop", "~> 0.38.0"
end
