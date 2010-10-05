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
    module Registry
      class << self
        attr_reader :all_plugins, :all_plugins_map
      end
      
      def self.register_plugin(plugin)
        @all_plugins << plugin
        @all_plugins_map[plugin.name] = plugin
      end
      
      def self.init_registry
        @all_plugins = []
        @all_plugins_map = {}
      end
      init_registry
    end
  end
end