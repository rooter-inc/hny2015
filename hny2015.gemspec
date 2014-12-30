# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hny2015/version'

Gem::Specification.new do |spec|
  spec.name          = "hny2015"
  spec.version       = Hny2015::VERSION
  spec.authors       = ["ROOTER,Inc."]
  spec.email         = ["contact@rooter.co.jp"]
  spec.summary       = %q{New Year's Greetings from ROOTER,Inc.}
  spec.description   = %q{New Year's Greetings from ROOTER,Inc.}
  spec.homepage      = "http://rooter.jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
