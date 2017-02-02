require "hamlit"
require "hamlit/block/script_compiler_extension"
require "hamlit/block/silent_script_compiler_extension"
require "hamlit/block/version"

require "hamlit/block/engine"

module Hamlit
  class Compiler
    ScriptCompiler.send(:prepend, Block::ScriptCompilerExtension)
    SilentScriptCompiler.send(:prepend, Block::SilentScriptCompilerExtension)
  end
end
