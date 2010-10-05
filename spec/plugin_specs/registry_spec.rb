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

describe Amp::Plugins::Registry do
  context '#register_plugin' do
    it 'should make plugins available in all_plugins' do
      plugin = Amp::Plugins::Base.new('cool_plugin_1')
      Amp::Plugins::Registry.register_plugin(plugin)
      Amp::Plugins::Registry.all_plugins.should include(plugin)
    end
    
    it 'should make plugins available in all_plugins_map' do
      plugin = Amp::Plugins::Base.new('cool_plugin_2')
      Amp::Plugins::Registry.register_plugin(plugin)
      Amp::Plugins::Registry.all_plugins_map['cool_plugin_2'].should == plugin
    end
  end
end