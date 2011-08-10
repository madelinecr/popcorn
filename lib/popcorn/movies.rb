require 'imdb_party'

module Popcorn
  class MovieManager

    def initialize
      @imdb = ImdbParty::Imdb.new
    end

    def lookup(name)
      @title = name
      movie = @imdb.find_by_title(@title)
      if movie.empty?
        print "Movie not found in IMDB database."
      else
        movie
      end
    end
  end
end
