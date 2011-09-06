# Third party require statements
require 'thor'

# Application specific require statements
require 'popcorn/movies'
require 'popcorn/settings'

class Popcorn::Driver < Thor

  desc "lookup MOVIE", "Look up a movie by name."
  def lookup(movie)
    @moviemgr = Popcorn::MovieManager.new
    puts "Looking up #{movie}"
    @moviemgr.lookup(movie)
    unless @moviemgr.movies.empty?
      puts "Title:   #{@moviemgr.movies[0][:title]}"
      puts "Year:    #{@moviemgr.movies[0][:year]}"
      puts "Art URL: #{@moviemgr.movies[0][:poster_url]}"
      puts "Path:    #{@moviemgr.path}"
    end
  end

  desc "library PATH", "Set library location."
  def library(path)
    Settings.library = path
  end
end
