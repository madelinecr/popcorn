require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'popcorn/movies'

describe "Movies" do

  before :each do
    @moviemgr = Popcorn::MovieManager.new
  end

  describe "fail" do

    it "should return a nil object" do
      @moviemgr.lookup("asdfasdfasdf").should be_nil
    end
  end

  describe "success" do
    it "should handle a filesystem path gracefully" do
      @moviemgr.lookup("testing/paths/Inception").class.should == Hash
    end

    it "should return the best match as a hash" do
      @moviemgr.lookup("Inception").class.should == Hash
    end
  end
end
