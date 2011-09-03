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
    movieresults = @moviemgr.lookup(movie)
    unless movieresults.nil?
      puts "Title:   #{movieresults[0][:title]}"
      puts "Year:    #{movieresults[0][:year]}"
      puts "Art URL: #{movieresults[0][:poster_url]}"
    end
  end

  desc "library PATH", "Set library location."
  def library(path)
    Settings.library = path
  end
end
