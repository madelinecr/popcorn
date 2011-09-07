require 'imdb_party'
require 'pathname'
require 'fileutils'
require 'uri'
require 'net/http'

require 'popcorn/settings'

module Popcorn
  class MovieManager

    attr_accessor :movie, :path

    def initialize
      @imdb = ImdbParty::Imdb.new
    end

    def lookup(movie)
      if @path.nil?
        @path = Pathname.new(movie)
      end
      movie = File.basename(movie, '.*')
      @movie = @imdb.find_by_title(movie)[0]
    end

    def save_to_library
      unless @path.exist?
        raise "Error: File does not exist #{@path}"
      end
      to_dir = "#{Settings.library}/#{@movie[:title]}/"
      filename = "#{@movie[:title]}#{@path.extname}"
      to_path = "#{to_dir}#{filename}"
      FileUtils.mkdir(to_dir)
      puts "Moving #{@path} to #{to_path}"
      FileUtils.mv(@path, to_path)
      self.save_poster(to_dir)
    end

    def save_poster(directory)
      unless movie[:poster_url].nil?
        splituri = URI.split(movie[:poster_url])
        Net::HTTP.start(splituri[2]) do |http|
          resp = http.get(splituri[5])
          open("#{directory}/#{@movie[:title]}.tbn", "wb") do |file|
            file.write(resp.body)
          end
        end
      end
    end
  end
end
