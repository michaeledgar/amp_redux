##################################################################
#                  Licensing Information                         #
#                                                                #
#  The following code is licensed, as standalone code, under     #
#  the Ruby License, unless otherwise directed within the code.  #
#                                                                #
#  For information on the license of this code when distributed  #
#  with and used in conjunction with the other modules in the    #
#  Amp project, please see the root-level LICENSE file.          #
#                                                                #
#  © Michael J. Edgar and Ari Brown, 2009-2010                   #
#                                                                #
##################################################################

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Amp::Dispatch::Runner do
  before do
    @runner = Amp::Dispatch::Runner.new(["hi", "there", "--how", "are", "you?"])
  end

  describe "#with_argv" do
    it "sets the value o ARGV" do
      current = ARGV
      @runner.with_argv(["hi", "there"]) do
        ARGV.should == ["hi", "there"]
      end
      ARGV.should == current
    end
  end
  
  describe "#collect_options!" do
    it "stops un unknown options" do
      @runner.with_argv(["help", "please"]) do
        options = @runner.collect_options!
        ARGV.should == ["help", "please"]
      end
    end
    
    it "parses --version automatically and exit" do
      @runner.with_argv(["--version", "please"]) do
        swizzling_stdout do
          proc { @runner.collect_options! }.should raise_error(SystemExit)
        end
      end
    end
    
    it "displays Amp::VERSION_TITLE with --version" do
      @runner.with_argv(["--version", "please"]) do
        result = swizzling_stdout do
          proc { @runner.collect_options! }.should raise_error(SystemExit)
        end
        result.should include(Amp::VERSION_TITLE)
      end
    end
  end
end