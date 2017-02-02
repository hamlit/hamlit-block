require 'hamlit/engine'

module Hamlit
  module Block
    class Engine < Temple::Engine
      define_options(
        :buffer_class,
        generator:    Temple::Generators::ArrayBuffer,
        format:       :html,
        attr_quote:   "'",
        escape_html:  false,
        escape_attrs: true,
        autoclose:    %w(area base basefont br col command embed frame
                         hr img input isindex keygen link menuitem meta
                         param source track wbr),
        filename:     "",
      )

      use Hamlit::Parser
      use Hamlit::Compiler
      use Hamlit::HTML
      use Hamlit::StringSplitter
      use Hamlit::StaticAnalyzer
      use Hamlit::Escapable
      use Hamlit::ForceEscapable
      filter :ControlFlow
      filter :MultiFlattener
      filter :StaticMerger
      use :Generator, -> { options[:generator] }
    end
  end
end
