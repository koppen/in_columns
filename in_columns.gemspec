# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'in_columns/version'

Gem::Specification.new do |spec|
  spec.name          = "in_columns"
  spec.version       = InColumns::VERSION
  spec.authors       = ["Jakob Skjerning"]
  spec.email         = ["jakob@mentalized.net"]
  spec.description   = %q{InColumns distributes the elements of an array into a number of equal-height columns.}
  spec.summary       = %q{Distributes array elements into columns.}
  spec.homepage      = "https://github.com/koppen/in_columns"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
