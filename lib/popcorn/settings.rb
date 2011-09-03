require 'pathname'
require 'yaml'

class Settings

  @conf_file = Pathname("~/.popcorn").expand_path

  class << self
    attr_accessor :conf_file, :library

    def init_settings
      unless @conf_file.exist?
        puts "Writing file."
        @conf_file.open("w") do |f|
          config = { :popcorn => { :lib => "~/tmp/popcorn" } }
          f.write(config.to_yaml)
        end
      end
    end

    def library
      init_settings
      @library = YAML::load(@conf_file.open())[:popcorn][:lib]
      @library
    end
  end
end
