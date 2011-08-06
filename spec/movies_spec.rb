require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Movies" do

  describe "fail" do
    it "should report no matches" do
      @moviemgr = Movies.new("asdfasdfasdf")
      @moviemgr.lookup
      STDOUT.string.should =~ /Movie not found in IMDB database/i
    end

    it "should return a nil object" do
      @moviemgr = Movies.new("asdfasdfasdf")
      @moviemgr.lookup.should be_nil
    end
  end

  describe "success" do
    it "should return an array of matches" do
      @moviemgr = Movies.new("Inception")
      @moviemgr.lookup.class.should == Array
    end
  end
end
