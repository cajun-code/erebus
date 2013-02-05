# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpp_dev_tool/version'

Gem::Specification.new do |gem|
  gem.name          = "cpp_dev_tool"
  gem.version       = CppDevTool::VERSION
  gem.authors       = ["Allan Davis"]
  gem.email         = ["cajun.code@gmail.com"]
  gem.description   = %q{C++ Project and File generators}
  gem.summary       = %q{C++ Development can be a pain. Project setup is dependent on the tools used in the project and the developer.  This tool is a command line tool for generating project and files independent of any ide or editor.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "thor", "~> 0.17.0"
  gem.add_dependency 'activesupport', "~> 3.2.11"
  gem.add_dependency 'i18n',"~> 0.6.1"
  gem.add_dependency "multi_json", "~> 1.5.0"
  gem.add_development_dependency "pry"
end
