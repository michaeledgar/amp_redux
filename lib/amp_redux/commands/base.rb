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

module Amp
  module Command
    # The base class frmo which all comamnds inherit.
    class Base
      def self.on_run(&block)
        @on_run = block if block_given?
        @on_run
      end
      
      def self.options
        @options ||= []
      end
      
      def self.opt(*args)
        self.options << args
      end
      
      # Runs the command with the provided options and arguments.
      def run(options, arguments)
        self.class.on_run.call(options, arguments)
      end
      
      # Collects the options specific to this command and returns them.
      def collect_options
        base_options = self.class.options
        Trollop::options do
          base_options.each do |option|
            opt *option
          end
        end
      end
    end
  end
end