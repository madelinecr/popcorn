require 'imdb_party'
require 'pathname'

module Popcorn
  class MovieManager

    attr_accessor :movies, :path

    def initialize
      @imdb = ImdbParty::Imdb.new
    end

    def lookup(path)
      @path = Pathname.new(path)
      @movies = @imdb.find_by_title(@path.basename)
    end
  end
end
