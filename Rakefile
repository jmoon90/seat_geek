require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

# Setup new RSpec for rake task
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: [:spec]
task test: :spec
