require "cpp_dev_tool/version"
require "cpp_dev_tool/generator"
require "thor"
require "fileutils"
require 'active_support/core_ext'
module CppDevTool
  # Your code goes here...
  class App < Thor
    def initialize(args, opts, config)
      super(args, opts, config)
      lib_dir = File.absolute_path(File.join(File.dirname(__FILE__), "cpp_dev_tool", "generators"))
      # puts "Lib Directory #{lib_dir}"
      Dir.foreach(lib_dir) do |file|
        # puts "Testing File: #{file}"
        if File.file?("#{lib_dir}/#{file}")
          base_name = File.basename(file, File.extname(file))
          # puts "Loading generator: #{base_name}"
          require File.join("cpp_dev_tool", "generators", base_name)
          clazz = Object.const_get(base_name.camelize)
          # puts clazz.desc
          # subcommand base_name, clazz
          #App.subcommand base_name, clazz
          App.register(clazz, base_name, clazz.usuage, clazz.desc)
        end
      end
    end
  end
end

