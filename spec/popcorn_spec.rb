require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Popcorn" do

  describe "success" do
  
    it "should search for a movie given a name" do
      @popcorn = Popcorn.new
      @popcorn.lookup("Inception")
      STDOUT.string.should =~ /Title:/i
    end
  end
end
