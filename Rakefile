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

  desc "Run integration specs"
  RSpec::Core::RakeTask.new :integrations do |task|
    task.pattern = 'spec/scenarios/**/*_spec.rb'
  end

rescue LoadError
  %W[unit integrations].each do |task_name|
    task task_name do
      warn "No RSpec"
      fail
    end
  end
end

task :default => %w[unit integrations]
