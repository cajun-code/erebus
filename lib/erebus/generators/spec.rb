require "erebus/generator"

class Spec < Erebus::NamedGenerator
  desc "Create a Igloo testing source file"
  
  #class_option :ext,:type => :string ,:default => "cpp", :desc => "Extention used for the source file"
  
  #validate_project
  
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_source_file
    Spec.validate_project
    template "templates/spec.erb", "spec/#{file_name}.#{ext}"
  end
  
  private
  def ext
    "cpp"
    #     options[:ext]
  end
end