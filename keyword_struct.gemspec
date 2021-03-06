# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'keyword_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "keyword_struct"
  spec.version       = KeywordStruct::VERSION
  spec.authors       = ["JT Archie"]
  spec.email         = ["jtarchie@gmail.com"]
  spec.summary       = %q{Create struct that uses Ruby keyword parameters as .new arguments}
  spec.description   = %q{Create struct that uses Ruby keyword parameters as .new arguments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
