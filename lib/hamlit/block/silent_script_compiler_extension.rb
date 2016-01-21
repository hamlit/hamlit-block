module Hamlit
  module Block
    # Suppress block's internal rendering result and pass it to [:capture, ...].
    module SilentScriptCompilerExtension
      attr_writer :identity

      def compile_with_children(node, &block)
        [:multi,
         [:block, node.value[:text],
          [:multi,
           [:newline],
           [:capture, @identity.generate, yield(node)],
          ],
         ]
        ]
      end
    end
  end
end
