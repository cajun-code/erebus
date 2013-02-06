require "cpp_dev_tool/generator"

class CppClass < CppDevTool::NamedGenerator
  desc "Create a C/C++ Class"
  
  #class_option :ext,:type => :string ,:default => "cpp", :desc => "Extention used for the source file"
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_header_file
    template "templates/class.h.erb", "include/#{file_name}.h"
  end
  def create_source_file
    template "templates/class.cpp.erb", "src/#{file_name}.cpp"
  end
  
  private
  # def ext
  #     options[:ext]
  #   end
end