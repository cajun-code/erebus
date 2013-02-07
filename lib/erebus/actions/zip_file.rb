require "zip/zip"
module Erebus
  module Actions
    module ZipFile
      
      def extract source_file, destination
        Zip::ZipFile.open(source_file) do |zip_file|
          zip_file.each do |f|
             f_path=File.join(destination, f.name)
             FileUtils.mkdir_p(File.dirname(f_path))
             zip_file.extract(f, f_path) unless File.exist?(f_path)
          end
        end
      end
      
    end
  end
end