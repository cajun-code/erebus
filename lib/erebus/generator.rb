require "thor"

module Erebus
  
  class ErebusError < StandardError
  end
  
  
  class Generator < Thor::Group 
    include Thor::Actions
    
    def self.usuage
      #"#{self_task.formatted_usage(self, false)}"
      self.help(Thor::Base.shell.new)
    end
    
    protected
    def date_time
      DateTime.now.strftime("%m/%d/%Y %H:%M")
    end
    def user
      ENV["USER"]
    end
    
    def self.validate_project
      fail ErebusError.new "Please go inside the project directory to run this command" if !File.exists? ".erebus"
    end
  end
  
  
  class NamedGenerator < Generator
    argument :name
    
    protected 
    def class_name
      name.camelize
    end 
    def file_name
      name.underscore
    end
  end
end