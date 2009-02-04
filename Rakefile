require 'rake'
require 'spec/rake/spectask'

desc 'Test the happy-titles plugin.'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ["-c"]
end