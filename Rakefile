require 'rake'
require 'spec/rake/spectask'

desc 'Test the happy-titles plugin.'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ["-c"]
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