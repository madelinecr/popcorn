# Third party require statements
require 'thor'

# Application specific require statements
require 'popcorn/movies'
require 'popcorn/settings'

class Popcorn::Driver < Thor

  desc "import MOVIE", "Move movie file into library."
  def import(movie)
    @moviemgr = Popcorn::MovieManager.new

    while true
      @moviemgr.lookup(movie)
      puts
      puts "Looking up #{movie}"
      unless @moviemgr.movie.nil?
        puts "Title:   #{@moviemgr.movie[:title]}"
        puts "Year:    #{@moviemgr.movie[:year]}"
        puts "Art URL: #{@moviemgr.movie[:poster_url]}"
        print "Is this correct? (y/n): "
        if STDIN.gets.chomp =~ /y/i
          begin
            @moviemgr.save_to_library
            puts "Movie successfully imported."
          rescue Exception => e
            puts e.message
          end
          break
        else
          print "Please enter new search term: "
          movie = STDIN.gets.chomp
        end
      end
    end
  end

  desc "library PATH", "Set library location."
  def library(path)
    Settings.library = path
  end
end
