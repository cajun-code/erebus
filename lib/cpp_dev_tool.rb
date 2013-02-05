require "cpp_dev_tool/version"
require "thor"
require "fileutils"
require 'active_support/core_ext'
module CppDevTool
  # Your code goes here...
  class App < Thor
    def initialize
      lib_dir = File.absolute_path(File.join(File.dirname(__FILE__), "cpp_dev_tool", "generators"))
      Dir.foreach(lib_dir) do |file|
        if File.file?(file)
          base_name = File.base_name(file, File.extname(file))
          require File.join("cpp_dev_tool", "generators", base_name)
          clazz = Object.const_get("CppDevTool").const_get("Generators").const_get(base_name.camelize.constantize)
        end
      end
    end
  end
end

