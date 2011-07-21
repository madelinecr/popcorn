#!/usr/bin/env ruby
require 'rubygems'
require 'thor'
require 'imdb_party'

class Popcorn < Thor

  desc "lookup MOVIE", "Look up a movie by name."
  def lookup(movie)
    @imdb = ImdbParty::Imdb.new
    puts "Looking up #{movie}"
    movie = @imdb.find_by_title(movie)
    if movie.empty?
      puts "Movie not found."
    else
      puts "Title:   #{movie[0][:title]}"
      puts "Year:    #{movie[0][:year]}"
      puts "Art URL: #{movie[0][:poster_url]}"
    end
  end
end

Popcorn.start
