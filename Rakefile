require 'rake'
require 'spec/rake/spectask'
require 'echoe'

Echoe.new('sortable_element_for_nested_set', '0.1.3') do |p|
  p.description    = "Rails plugin for using script.aculo.us sortable_element for trees backed by nested sets."
  p.url            = "http://github.com/robinsp/sortable_element_for_nested_set"
  p.author         = "Robin Spainhour"
  p.email          = "robin@robinspainhour.com"
  p.ignore_pattern = ["tmp/*"]
  p.development_dependencies = ["rspec >= 1.2.4", 
                                "rspec-rails >= 1.2.4",
                                "mocha >= 0.9.5"]
end


desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
  t.spec_files = FileList['spec/**/*_spec.rb']
end
