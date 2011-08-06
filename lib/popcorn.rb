#!/usr/bin/env ruby

# Third party require statements
require 'rubygems'
require 'thor'

# Application specific require statements
require 'movie'

class Popcorn < Thor

  desc "lookup MOVIE", "Look up a movie by name."
  def lookup(movie)
    @moviemgr = Movie.new(movie)
    puts "Looking up #{movie}"
    movieresults = @moviemgr.lookup
    unless movieresults.nil?
      puts "Title:   #{movieresults[0][:title]}"
      puts "Year:    #{movieresults[0][:year]}"
      puts "Art URL: #{movieresults[0][:poster_url]}"
    end
  end
end

Popcorn.start
