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
require 'amp_redux/dispatch/commands/base'

describe Amp::Command::Base do
  before do
    @klass = Class.new(Amp::Command::Base)
  end
  
  describe '#on_call' do
    it "sets the class's on_call handler when a block is given" do
      flag = false
      @klass.on_call { |opts,args| flag = true }
      @klass.new.call(nil, nil)
      flag.should be_true
    end
    
    it 'returns the current handler if no block is given' do
      @klass.on_call.should == nil
      @klass.on_call { |opts,args| puts 'hello' }
      @klass.on_call.should_not == nil
      @klass.on_call.should respond_to(:call)
    end
  end
  
  describe '#opt' do
    it 'adds an option to the command class' do
      @klass.options.should == []
      @klass.opt :verbose, 'Provide verbose output', :type => :boolean
      @klass.options.should == [[:verbose, 'Provide verbose output',
                                {:type => :boolean}]
                               ]
    end
  end
  
  describe '#collect_options' do
    context 'with no options specified' do
      it 'returns a nearly empty hash' do
        @klass.new.collect_options.should == {:help => false}
      end
    end
    
    context 'with --verbose specified and not provided' do
      it 'returns :verbose_given => false' do
        opts = nil
        swizzling_argv([]) do
          @klass.opt :verbose, 'Text', :type => :boolean
          opts = @klass.new.collect_options
        end
        opts[:verbose_given].should be_false
      end
    end
    
    context 'with --verbose specified and provided' do
      it 'returns :verbose_given => true, :verbose => true' do
        opts = nil
        swizzling_argv(['--verbose']) do
          @klass.opt :verbose, 'Text', :type => :boolean
          opts = @klass.new.collect_options
        end
        opts[:verbose_given].should be_true
        opts[:verbose].should be_true
      end
    end
  end
end