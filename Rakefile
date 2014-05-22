require "bundler/gem_tasks"

task :test do
  exec "cutest -r ./test/helper.rb test/*_test.rb"
end

task :default => :test
