require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'popcorn/settings'
require 'fakefs/spec_helpers'

describe "Settings" do
  include FakeFS::SpecHelpers

  describe "config file" do

    it "should be created if one doesn't exist" do
      File.should_not exist("~/.popcorn")
      Settings.write_settings
      File.should exist("~/.popcorn")
    end
  end

  describe "set library directory value" do

    it "should create directory" do
      Settings.library = "~/testlib"
      puts Settings.library
      path = Pathname.new(Settings.library.to_s)
      path.should exist
    end
  end

  describe "get library directory value" do
    
    it "should return existing directory" do
      Settings.library
      path = Pathname.new(Settings.library.to_s)
      path.should exist
    end
  end
end
