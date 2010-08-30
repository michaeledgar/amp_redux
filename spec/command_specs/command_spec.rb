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
require 'amp_redux/commands/command'

counter = 0

describe Amp::Dispatch::Runner do
  define_method :next_name do
    counter += 1
    "TempClass#{counter}"
  end

  context 'when created with a specific name' do
    before do
      @name = next_name
      @class = Amp::Command.create(@name) do |c|
        c.opt :verbose, "Verbose output", :type => :boolean
      end
    end
    
    it 'creates the named class as a submodule of Amp::Command' do
      Amp::Command.const_get(@name).should == @class
    end
    
    it 'uppercases the first letter of the name' do
      klass = Amp::Command.create('search0') {|c| }
      Amp::Command.const_get('Search0').should == klass
    end
  end
end