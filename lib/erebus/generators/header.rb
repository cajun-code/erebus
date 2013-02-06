require "erebus/generator"

class Header < Erebus::NamedGenerator
  desc "Create a C/C++ header file"
  
  class_option :ext,:type => :string ,:default => "h", :desc => "Extention used for the header"
  
  
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_header_file
    Header.validate_project
    template "templates/blank.erb", "include/#{file_name}.#{ext}"
  end
  
  private
  def ext
    options[:ext]
  end
end