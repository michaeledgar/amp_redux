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
  module Plugins
    class Base < Struct.new(:name, :module, :author)
      def initialize(*args)
        super
        yield self if block_given?
      end
    
      def inspect
        "#<Amp::Plugin::#{self.module} #{name} by #{author}>"
      end
      
      def module
        super || name.capitalize
      end
    end
  end
end