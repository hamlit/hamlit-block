require 'temple'

# Load tilt/haml first to override if available
begin
  require 'haml'
rescue LoadError
else
  require 'tilt/haml'
end

# Load hamlit first to override if available
require 'hamlit'

module Hamlit
  module Block
    Template = Temple::Templates::Tilt.create(
      Hamlit::Block::Engine,
      register_as: :haml,
    )

    module TemplateExtension
      # Activate Hamlit::Helpers for tilt templates.
      # https://github.com/judofyr/temple/blob/v0.7.6/lib/temple/mixins/template.rb#L7-L11
      def compile(*)
        "extend Hamlit::Helpers; #{super}"
      end
    end
    Template.send(:extend, TemplateExtension)
  end
end
