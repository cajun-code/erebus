require "erebus/generator"
require "erebus/actions/zip_file"
class SetupTest < Erebus::NamedGenerator
  desc "Add testing framework Igloo to project"
  
  include Erebus::Actions::ZipFile
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def get_test_framework
    #SetupTest.validate_project
    get "https://github.com/joakimkarlsson/igloo/archive/master.zip", "#{class_name}/lib/igloo.zip"
    say_status :extracting, "#{class_name}/lib/igloo.zip"
    extract "#{class_name}/lib/igloo.zip",  "#{class_name}/lib"
    remove_file "#{class_name}/lib/igloo.zip"
  end
  
  def create_test_runner
    template "templates/spec_runner.cpp.erb", "#{class_name}/spec/runner.cpp"
  end
  
  def append_rake_command
    if !File.exist?("#{class_name}/test.rake")
      template "templates/rake_test.erb", "#{class_name}/test.rake"
      append_file "#{class_name}/Rakefile", 'import "test.rake"'
    end
  end
end