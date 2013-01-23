# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testdo/version'

Gem::Specification.new do |gem|
  gem.name          = "testdo"
  gem.version       = Testdo::VERSION
  gem.authors       = ["Alexander K"]
  gem.email         = ["xpyro@ya.ru"]
  gem.description   = %q{extremely minimalistic unit test helper for ruby 2.0}
  gem.summary       = %q{extremely minimalistic unit test helper for ruby 2.0}
  gem.homepage      = "https://github.com/sowcow/testdo"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('cucumber')
  gem.add_development_dependency('aruba')
end
