require "hamlit"
require "hamlit/block/compiler_extension"
require "hamlit/block/script_compiler_extension"
require "hamlit/block/silent_script_compiler_extension"
require "hamlit/block/version"

module Hamlit
  class Compiler
    prepend Block::CompilerExtension

    ScriptCompiler.send(:prepend, Block::ScriptCompilerExtension)
    SilentScriptCompiler.send(:prepend, Block::SilentScriptCompilerExtension)
  end

  # Maybe hamlit-block's users expect this. This is Haml's default.
  Engine.options[:escape_html] = false
end
