module Hamlit
  module Block
    # Suppress block's internal rendering result and pass it to [:capture, ...].
    module ScriptCompilerExtension
      def compile_script_assign(var, node, &block)
        if node.children.empty?
          super
        else
          [:multi,
           [:block, "#{var} = #{node.value[:text]}",
            [:multi,
             [:newline],
             [:capture, var, yield(node)],
            ],
           ],
          ]
        end
      end
    end
  end
end
