require 'hamlit/block/script_compiler'
require 'hamlit/block/silent_script_compiler'

module Hamlit
  module Block
    class Compiler < ::Hamlit::Compiler
      def initialize(options = {})
        super

        # Re-generate identity for Hamlit::Block and share it
        identity = Identity.new
        @tag_compiler = ::Hamlit::Compiler::TagCompiler.new(identity, options)

        # Replace internal compilers with Hamlit::Block's ones.
        @script_compiler        = ::Hamlit::Block::ScriptCompiler.new(identity)
        @silent_script_compiler = ::Hamlit::Block::SilentScriptCompiler.new(identity)
      end
    end
  end
end
