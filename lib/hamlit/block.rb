require "hamlit"
require "hamlit/block/script_compiler_extension"
require "hamlit/block/version"

module Hamlit
  class Compiler
    ScriptCompiler.send(:prepend, Block::ScriptCompilerExtension)
  end

  # Maybe hamlit-block's users expect this. This is Haml's default.
  Engine.options[:escape_html] = false
end
