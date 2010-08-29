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
  module Dispatch
    class Runner
      def initialize(args)
        @args = args
      end
    
      def run!
        with_argv @args do
          global_opts = collect_options!
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
    
    