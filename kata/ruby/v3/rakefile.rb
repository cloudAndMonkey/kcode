require 'rake/testtask'

task :default => [:unit_test]

Rake::TestTask.new(:unit_test) do | tsk |
 tsk.libs << "./app:./test"
 tsk.test_files = "AllTests.rb"
end