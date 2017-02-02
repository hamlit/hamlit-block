module Hamlit
  module Block
    # Suppress block's internal rendering result and pass it to [:capture, ...]
    # if the silent script is `do .. end` block
    class SilentScriptCompiler < ::Hamlit::Compiler::SilentScriptCompiler
      def initialize(identity)
        @identity = identity
      end

      BLOCK_REGEX = /do(\s*\|\s*[^\|]*\s*\|)?\s*\z/

      def compile_with_children(node, &block)
        if node.value[:text] =~ BLOCK_REGEX
          [:multi,
           [:block, node.value[:text],
            [:multi,
             [:newline],
             [:capture, @identity.generate, yield(node)],
            ],
           ]
          ]
        else
          super
        end
      end
    end
  end
end
