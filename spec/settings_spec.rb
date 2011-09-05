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

  end
end
