# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sluggo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Walters"]
  gem.email         = ["dennis@elevatorup.com"]
  gem.description   = %q{A gobbledeygook string generator}
  gem.summary       = %q{A gobbledeygook string generator}
  gem.homepage      = "http://github.com/ess/sluggo"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sluggo"
  gem.require_paths = ["lib"]
  gem.version       = Sluggo::VERSION

  gem.add_dependency 'radix62', '~> 1.0.1'
  gem.add_development_dependency 'minitest', '~> 5.0.8'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rake', '~> 10.1.0'
end
