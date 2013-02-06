require "thor"

module CppDevTool
  class Generator < Thor::Group 
    include Thor::Actions
    
    def self.usuage
      "#{self_task.formatted_usage(self, false)}"
    end
    
    protected
    def date_time
      DateTime.now.strftime("%m/%d/%Y %H:%M")
    end
    def user
      ENV["USER"]
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