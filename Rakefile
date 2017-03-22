require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require './app/app.rb'

  RuboCop::RakeTask.new(:cop)
  RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec]

  namespace :db do
    desc "Non destructive upgrade"
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto-upgrade complete (data was not lost)"
    end

    desc "Destructive upgrade"
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Auto-migrate complete (data was lost)"
    end
  end
