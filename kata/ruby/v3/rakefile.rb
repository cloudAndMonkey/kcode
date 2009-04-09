require 'rake/testtask'

task :default => [:unit_test]

Rake::TestTask.new(:unit_test) do | tsk |
 tsk.libs << "./app" + File::PATH_SEPARATOR + "./test"
 tsk.test_files = "AllTests.rb"
end