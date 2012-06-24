
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  # Keep it simple, Sam.
  t.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
