#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

$:.push File.expand_path("../lib", __FILE__)

begin
  require 'bundler/gem_tasks'
rescue LoadError
  warn "No Bundler, No Gem tasks"
end

begin
  require 'rspec'
  require 'rspec/core/rake_task'

  desc "Run unit specs"
  RSpec::Core::RakeTask.new :unit do |task|
    task.pattern = 'spec/unit/**/*_spec.rb'
  end

  require 'cucumber'
  require 'cucumber/rake/task'

  desc "Run features"
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
  end

rescue LoadError
  %W[unit features].each do |task_name|
    task task_name do
      warn "Tests unavaiable without RSpec/Cucumber"
      fail
    end
  end
end

task default: %w[unit features]
