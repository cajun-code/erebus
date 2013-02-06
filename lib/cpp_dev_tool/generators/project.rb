require "cpp_dev_tool/generator"

class Project < CppDevTool::Generator
  desc "Create a C/C++ Project"
  argument :name
      
  def self.source_root
    File.dirname(__FILE__)
  end
      
  def create_rake_file
    template "templates/rake.erb", "#{class_name}/Rakefile"
  end
  def create_git_ignore
    template "templates/ignore.erb", "#{class_name}/.gitignore"
  end
  def create_include_dir
    create_file "#{class_name}/include/.gitkeep"
  end
  def create_main_file
    template "templates/main.cpp.erb", "#{class_name}/src/main.cpp"
  end
  private 
  def class_name
    name.camelize
  end 
end
  
