require "cpp_dev_tool/generator"

class Source < CppDevTool::NamedGenerator
  desc "Create a C/C++ Source file"
  
  class_option :ext,:type => :string ,:default => "cpp", :desc => "Extention used for the source file"
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_source_file
    template "templates/blank.erb", "src/#{file_name}.#{ext}"
  end
  
  private
  def ext
    options[:ext]
  end
end