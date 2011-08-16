require 'imdb_party'
require 'pathname'

module Popcorn
  class MovieManager

    def initialize
      @imdb = ImdbParty::Imdb.new
    end

    def lookup(path)
      @path = Pathname.new(path)
      movie = @imdb.find_by_title(@path.basename)
      if movie.empty?
        print "Movie not found in IMDB database."
      else
        movie
      end
    end
  end
end
