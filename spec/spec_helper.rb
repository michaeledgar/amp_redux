$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'amp_redux'
require 'spec'

Spec::Runner.configure do |config|
end

def swizzling_stdout
  new_stdout = StringIO.new
  $stdout, old_stdout = new_stdout, $stdout
  yield
  new_stdout.string
ensure
  $stdout = old_stdout
  new_stdout.string
end