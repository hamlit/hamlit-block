module Hamlit
  module Block
    # Set identity for SilentScriptCompiler
    class Compiler < ::Hamlit::Compiler
      def initialize(*)
        super
        @silent_script_compiler.identity = @script_compiler.identity
      end
    end
  end
end
