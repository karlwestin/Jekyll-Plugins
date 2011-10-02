module Jekyll

  # Purpose: 
  # Have certain static files: css, js, presentation images
  # OUTSIDE of the (dropbox-shared) "_content" - directory
  
  class Site
  
    # override the original "read" function
  
    # Read Site data from disk and load it into internal data structures.
    #
    # Returns nothing.
    def read
      self.read_layouts
      self.read_directories
      self.read_static "../_static"
    end
    
    # adding a read_static function, looking for static files _only_ in the specified directory
    
    def read_static(dir = '', orig_dir = '')
    
      # just not having to pass in the static directory twice on first load
      orig_dir = dir if orig_dir.empty?
    
      base = File.join(self.source, dir)
      
      entries = Dir.chdir(base) { filter_entries(Dir['*']) }

      entries.each do |f|
        f_abs = File.join(base, f)
        f_rel = File.join(dir, f)
        if File.directory?(f_abs)
          next if self.dest.sub(/\/$/, '') == f_abs
          read_static(f_rel, orig_dir)
        elsif !File.symlink?(f_abs)

            # filter the source dir out to make it end up in "_site" folder
            filtered_dir = dir.sub(orig_dir, "")
            source_dir = self.source + "/" + orig_dir + "/"       

            # All files found are treated as static files
            static_files << StaticFile.new(self, source_dir, filtered_dir, f)
        end
      end
    end    
    
  end

end