require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Movies" do

  before :each do
    @moviemgr = Movies.new
  end

  describe "fail" do
    it "should report no matches" do
      @moviemgr.lookup("asdfasdfasdf")
      STDOUT.string.should =~ /Movie not found in IMDB database/i
    end

    it "should return a nil object" do
      @moviemgr.lookup("asdfasdfasdf").should be_nil
    end
  end

  describe "success" do
    it "should return an array of matches" do
      @moviemgr.lookup("Inception").class.should == Array
    end
  end
end
