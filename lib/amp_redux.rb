module Amp
  VERSION = "0.0.1"
  VERSION_TITLE = "Koyaanisqatsi"
  
  $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
  module Command
    autoload :Base, "amp_redux/dispatch/commands/base.rb"
    autoload :Validations, 'amp_redux/dispatch/commands/validations.rb'
  end
  module Dispatch
    autoload :Runner, "amp_redux/dispatch/runner.rb"
  end
  module Plugins
    autoload :Base, 'amp_redux/plugins/base.rb'
    autoload :Registry, 'amp_redux/plugins/registry.rb'
  end
end

autoload :Trollop, "amp_redux/third_party/trollop.rb"