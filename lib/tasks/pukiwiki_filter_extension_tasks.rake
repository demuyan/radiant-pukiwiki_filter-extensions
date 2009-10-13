namespace :radiant do
  namespace :extensions do
    namespace :pukiwiki_filter do
      
      desc "Runs the migration of the Pukiwiki Filter extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PukiwikiFilterExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PukiwikiFilterExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Pukiwiki Filter to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[PukiwikiFilterExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PukiwikiFilterExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
