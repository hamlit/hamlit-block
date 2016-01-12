# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hamlit/block/version'

Gem::Specification.new do |spec|
  spec.name          = "hamlit-block"
  spec.version       = Hamlit::Block::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashi-kokubun@cookpad.com"]

  spec.summary       = %q{Hamlit extension to support capturing via yield}
  spec.description   = %q{Hamlit extension to support capturing via yield}
  spec.homepage      = "https://github.com/hamlit/hamlit-block"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hamlit", ">= 2.0", "< 2.4"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "unindent"
end
