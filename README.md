# Testdo

tested on ruby-2.0.0-preview2
tests fail on ruby-head :( (http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/RefinementsSpec)
I'll wait till next ruby release

```ruby
# your code
a = 2

if __FILE__ == $0
require 'testdo'
test do
  # your expecations using === or Array#(all? any? ...)
  a + 1 === 3
  [1, a].any? { |x| x > 1 }
  /\d/ === a.to_s
  [1,2,2,3,3] - [1,2,3] === []
end
end
```

more examples at features/*

## Installation

Add this line to your application's Gemfile:

    gem 'testdo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install testdo

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
