require 'pathname'
require 'fileutils'
require 'yaml'

class Settings

  @conf_file = Pathname("~/.popcorn").expand_path
  @default_library = Pathname("~/popcorn").expand_path

  class << self
    attr_accessor :conf_file, :library

    def write_settings(options={})
      defaults = { :library => @default_library.to_s }
      options = defaults.merge(options)
      puts "Writing file."
      @conf_file.open("w") do |f|
        config = { :popcorn => options }
        f.write(config.to_yaml)
      end
      FileUtils.mkdir_p(Pathname(options[:library]).expand_path.to_s)
    end

    def library
      unless @conf_file.exist?
        write_settings
      end
      @library = YAML::load(@conf_file.open())[:popcorn][:library]
    end

    def library= (value)
      @library = value
      write_settings(:library => value)
    end
  end
end
