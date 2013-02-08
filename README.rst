Erebus
==============

C++ Development can be a pain. Project setup is dependent on the tools used in the project and the developer.  This tool is a command line tool for generating project and files independent of any ide or editor.  

Installation
---------------

Install it yourself as:

   $ gem install erebus

Usage
-----------

To create a new C++ project:

   erebos project NAME

To see a list of tasks erebus can do:

   erebos

To create a header file:

    erebos header NAME

To create a C++ source file:

    erebos source NAME
    
To create a C source file:

    erebos source NAME --ext c
    
To generate a C++ class:
    
    erebos cpp_class NAME

Contributing
--------------

Project tracking is on a Pivotal Tracker Project https://www.pivotaltracker.com/projects/751383

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
