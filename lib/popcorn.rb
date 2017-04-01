# Third party require statements
require 'thor'

# Application specific require statements
require 'popcorn/movies'
require 'popcorn/settings'

class Popcorn::Driver < Thor

  desc "import MOVIE", "Move movie file into library."
  def import(movie_filename)
    @moviemgr = Popcorn::MovieManager.new

    while true
      puts "Please enter search term for movie name: "
      movie = STDIN.gets.chomp

      @moviemgr.lookup(movie, movie_filename)
      puts
      puts "Looking up #{movie}"
      unless @moviemgr.movie.nil?
        puts "Title:   #{@moviemgr.movie[:title]}"
        puts "Year:    #{@moviemgr.movie[:year]}"
        print "Is this correct? (y/n): "
        if STDIN.gets.chomp =~ /y/i
          begin
            @moviemgr.save_to_library
            puts "Movie successfully imported."
          rescue Exception => e
            puts e.message
          end
          break
        end
      end
    end
  end

  desc "library PATH", "Set library location."
  def library(path)
    Settings.library = path
  end
end
