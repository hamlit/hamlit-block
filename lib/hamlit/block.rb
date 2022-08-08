require "hamlit"
# In Hamlit 2.16.1+, ScriptCompiler#initialize takes the second argument
# and the following code stops working.
#
# Two ways to fix it:
# * Use Hamlit 3+. Its Tilt integration now works like hamlit-block by default.
# * Keep using Hamlit 2.16.1~2.16.2 and configure `disable_capture: false`
#
# Obviously, you should also uninstall hamlit-block.gem if you use Hamlit 2.16.1+
# now that it's ignored here.
if Gem::Version.new(Hamlit::VERSION) <= "2.16.0"
  require "hamlit/block/engine"
  require "hamlit/block/version"
  require "hamlit/block/template"
end
