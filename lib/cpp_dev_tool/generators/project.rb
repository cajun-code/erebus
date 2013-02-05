require "cpp_dev_tool/generator"
module CppDevTool
  module Generators
    class Project < CppDevTool::Generator
      desc "Create a C/C++ Project"
      argument :name
      
      def self.source_root
        File.dirname(__FILE__)
      end
      
      def create_rake_file
        template "templates/rake.erb", "#{class_name}/Rakefile"
      end
      
      private 
      def class_name
        name.camelize
      end 
    end
  end
end
