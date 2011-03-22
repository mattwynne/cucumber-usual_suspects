require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |task|
  task.cucumber_opts = '--color --format progress'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = '--color'
end

task :default => [:spec, :cucumber]
