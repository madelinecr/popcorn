require 'pathname'
require 'yaml'

class Settings

  @conf_file = Pathname("~/.popcorn").expand_path

  class << self
    attr_accessor :conf_file, :library

    def write_settings(options={})
      defaults = { :library => "~/tmp/popcorn" }
      options = defaults.merge(options)
      puts "Writing file."
      @conf_file.open("w") do |f|
        config = { :popcorn => options }
        f.write(config.to_yaml)
      end
    end

    def library
      unless @conf_file.exist?
        write_settings
      end
      if @library.nil?
        @library = YAML::load(@conf_file.open())[:popcorn][:library]
      end
      @library
    end

    def library= (value)
      @library = value      
      write_settings(:library => value)
    end
  end
end
