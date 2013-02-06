require "erebus/generator"

class Project < Erebus::NamedGenerator
  desc "Create a C/C++ Project"
  
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
  
  def create_erebus_file
    template "templates/project.erebus.erb", "#{class_name}/.erebus"
  end
  
end
  
