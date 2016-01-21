module Hamlit
  module Block
    # Set identity for SilentScriptCompilerExtension
    module CompilerExtension
      def initialize(*)
        super
        @silent_script_compiler.identity = @script_compiler.identity
      end
    end
  end
end
