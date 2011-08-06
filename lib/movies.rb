require 'imdb_party'

class Movies

  def initialize(name)
    @title = name
    @imdb = ImdbParty::Imdb.new
  end

  def lookup
    movie = @imdb.find_by_title(@title)
    if movie.empty?
      print "Movie not found in IMDB database."
    else
      movie
    end
  end
end
