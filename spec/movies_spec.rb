require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'popcorn/movies'

describe "Movies" do

  before :each do
    @moviemgr = Popcorn::MovieManager.new
  end

  describe "fail" do

    it "should return a nil object" do
      @moviemgr.lookup("asdfasdfasdf").should be_empty
    end
  end

  describe "success" do
    it "should handle a filesystem path gracefully" do
      @moviemgr.lookup("testing/paths/Inception").class.should == Array
    end

    it "should return an array of matches" do
      @moviemgr.lookup("Inception").class.should == Array
    end
  end
end
