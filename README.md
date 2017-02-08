# Hamlit::Block

Hamlit extension to support capturing via yield

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hamlit-block'
```

And then execute:

    $ bundle

## Usage

Use `Hamlit::Block::Engine` instead of `Hamlit::Engine`. Contents inside script block is not rendered but available via `yield`.

See [spec](spec/hamlit/block_spec.rb) for detail.

### For Tilt

```rb
require 'hamlit/block'
```

would be enough. It will override :haml registration of Tilt with `Hamlit::Block::Template` automatically.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
