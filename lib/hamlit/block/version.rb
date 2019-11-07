module Hamlit
  module Block
    VERSION = "0.7.0"

    begin
      require 'cell/hamlit/version'
    rescue LoadError
    else
      if Gem::Version.new(Cell::Hamlit::VERSION) <= Gem::Version.new('0.2')
        raise NotImplementedError.new('hamlit-block does not support cells-hamlit <= 0.2. See https://github.com/trailblazer/cells-hamlit/issues/6')
      end
    end
  end
end
