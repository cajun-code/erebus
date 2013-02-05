require "thor"

module CppDevTool
  class Generator < Thor::Group 
    include Thor::Actions
    
    def self.usuage
      "#{self_task.formatted_usage(self, false)}"
    end
  end
end