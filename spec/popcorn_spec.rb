require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'popcorn'

describe "Popcorn" do

  describe "success" do
  
    it "should search for a movie given a name" do
      @popcorn = Popcorn::Driver.new
      @popcorn.lookup("Inception")
      STDOUT.string.should =~ /Title:/i
    end
  end
end
