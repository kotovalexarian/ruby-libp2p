# frozen_string_literal: true

require 'bundler/gem_tasks'

CLEAN << 'spec/examples.txt'
CLEAN << 'coverage'
CLEAN << 'doc'
CLEAN << '.yardoc'

desc 'Run default checks'
task default: %i[test lint]

desc 'Run tests'
task test: :spec

desc 'Run code analysis tools'
task lint: :rubocop

desc 'Fix code style (rubocop --auto-correct)'
task fix: 'rubocop:auto_correct'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
rescue LoadError
  nil
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  nil
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  nil
end

desc 'Open development console'
task :console do
  sh 'bundle', 'exec', File.expand_path(File.join('bin', 'console'), __dir__)
end
