module Amp
  VERSION = "0.0.1"
  VERSION_TITLE = "Koyaanisqatsi"
  
  $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
  
  module Dispatch
    autoload :Runner, "amp_redux/dispatch/runner.rb"
  end
end

autoload :Trollop, "amp_redux/third_party/trollop.rb"