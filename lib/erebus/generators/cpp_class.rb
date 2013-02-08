require "erebus/generator"

class CppClass < Erebus::NamedGenerator
  desc "Create a C/C++ Class"
  
  #validate_project
  
  #class_option :ext,:type => :string ,:default => "cpp", :desc => "Extention used for the source file"
  
  class_option :testing, :type => :boolean, :default => true
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_header_file
    CppClass.validate_project
    template "templates/class.h.erb", "include/#{file_name}.h"
  end
  def create_source_file
    template "templates/class.cpp.erb", "src/#{file_name}.cpp"
  end
  
  def add_testing_framework
    if options[:testing]
      invoke "spec", ["#{class_name}"]
    end
  end
  
  private
  # def ext
  #     options[:ext]
  #   end
end