# Testdo

tested on ruby-2.0.0-preview2

    if __FILE__ == $0
    require 'testdo'
    test do
      a = 2
      # your expecations using === or Array#all? etc.
      a === 2
      [a, a].all? { |x| x == 2 }
      /\d/ === a.to_s
    end
    end

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
