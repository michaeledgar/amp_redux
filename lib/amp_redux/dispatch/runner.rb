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
require 'amp_redux/dispatch/commands/command'

module Amp
  module Dispatch
    
    # This class runs Amp as a binary. Create a new instance with the arguments
    # to use, and call call! to run Amp.
    class Runner
      def initialize(args)
        @args = args
      end
    
      def call!
        with_argv @args do
          global_opts = collect_options!
          
          command_class = Amp::Command.for_name(ARGV.join(' '))
          command = command_class.new
          trim_argv_for_command(command_class)
          opts = global_opts.merge command.collect_options
          command.call(opts, ARGV)
        end
      end
      
      def trim_argv_for_command(command)
        path_parts = command.name.gsub(/Amp::Command::/, '').gsub(/::/, ' ').split
        path_parts.each do |part|
          next_part = ARGV.shift
          if next_part.downcase != part.downcase
            raise ArgumentError.new(
                "Failed to parse command line option for: #{command}")
          end
        end
      end
      
      def collect_options!
        Trollop::options do
          banner "Amp - some more crystal, sir?"
          version "Amp version #{Amp::VERSION} (#{Amp::VERSION_TITLE})"
          stop_on_unknown
        end
      end
    
      def with_argv(new_argv)
        old_argv = ARGV.dup
        ARGV.replace(new_argv)
        yield
      ensure
        ARGV.replace(old_argv)
      end
    end
  end
end
    
    