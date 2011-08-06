require 'imdb_party'

class Movie

  def initialize(name)
    @title = name
    @imdb = ImdbParty::Imdb.new
  end

  def lookup
    movie = @imdb.find_by_title(@title)
    if movie.empty?
      puts "Movie not found in IMDB database."
    else
      movie
    end
  end
end
