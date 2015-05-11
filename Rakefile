require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default do
  puts 'Default task does nothing for now'
end


task :test do |task|
   Cucumber::Rake::Task.new(:run) do |t|
    t.profile = "html"
  end
  Rake::Task[:run].invoke()
end



