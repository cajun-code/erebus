require "erebus/generator"
require "erebus/actions/zip_file"
class SetupTest < Erebus::Generator
  desc "Add testing framework Igloo to project"
  
  include Erebus::Actions::ZipFile
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def get_test_framework
    SetupTest.validate_project
    get "https://github.com/joakimkarlsson/igloo/archive/master.zip", "lib/igloo.zip"
    extract "lib/igloo.zip",  "lib"
    remove_file "lib/igloo.zip"
  end
  
  def create_test_runner
    template "templates/spec_runner.cpp.erb", "spec/runner.cpp"
  end
  
  def append_rake_command
    if !File.exist?("test.rake")
      template "templates/rake_test.erb", "test.rake"
      append_file "Rakefile", 'import "test.rake"'
    end
  end
end