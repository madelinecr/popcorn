# Third party require statements
require 'thor'

# Application specific require statements
require 'movies'

class Popcorn < Thor

  desc "lookup MOVIE", "Look up a movie by name."
  def lookup(movie)
    @moviemgr = Movies.new
    puts "Looking up #{movie}"
    movieresults = @moviemgr.lookup(movie)
    unless movieresults.nil?
      puts "Title:   #{movieresults[0][:title]}"
      puts "Year:    #{movieresults[0][:year]}"
      puts "Art URL: #{movieresults[0][:poster_url]}"
    end
  end
end
