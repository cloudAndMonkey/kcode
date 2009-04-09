$:.unshift File.join(File.dirname(__FILE__), "app")

require 'rake/testtask'

task :default => [:coverage]

require 'rcov/rcovtask'
Rcov::RcovTask.new(:coverage) do |t|
  t.test_files = FileList['test/AllTests.rb']
  t.rcov_opts << "-I ./app:./test"
  t.output_dir = "coverageout"
end

#task :move do
#  if ENV['CC_BUILD_ARTIFACTS']
#   dir = ENV['CC_BUILD_ARTIFACTS']
#    #File.move("./coverageout", dir + "/out")
#    File.move("./coverageout", dir)
#  end
  #File.move("./out/out.grph", dir + "/out.grph")
  #Dir.mkdir(dir + "/out")
  #File.move
#end

# task :cruise => [:coverage, :move]