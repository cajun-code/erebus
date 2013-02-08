require "erebus/generator"

class Spec < Erebus::NamedGenerator
  desc "Create a Igloo testing source file"
  
  #class_option :ext,:type => :string ,:default => "cpp", :desc => "Extention used for the source file"
 
  class_option :use_alt, :type => :boolean, :default => true, :desc => "Use the alt syntax for igloo"
 
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def create_source_file
    Spec.validate_project
    if(options[:use_alt])
      template "templates/spec_alt.erb", "spec/#{file_name}_spec.#{ext}"
    else
      template "templates/spec.erb", "spec/#{file_name}_spec.#{ext}"
    end
  end
  
  private
  def ext
    "cpp"
    #     options[:ext]
  end
end