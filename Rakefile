require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

desc 'Test the happy-titles plugin.'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = FileList['spec/*_spec.rb']
  t.rspec_opts = ['-c']
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "happy-titles"
    gemspec.summary = "A simple way to handle page titles in your layouts."
    gemspec.email = "andy@andy-pearson.com"
    gemspec.homepage = "http://github.com/andypearson/happy-titles"
    gemspec.authors = ["Andy Pearson"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end