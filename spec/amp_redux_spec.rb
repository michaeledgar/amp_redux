require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Amp do
  it "has a version" do
    Amp::VERSION.should_not be_nil
  end
  
  it "has a version title" do
    Amp::VERSION_TITLE.should_not be_nil
  end
end
