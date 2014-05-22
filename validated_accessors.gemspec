# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validated_accessors'

Gem::Specification.new do |spec|
  spec.name          = "validated_accessors"
  spec.version       = ValidatedAccessors::VERSION
  spec.authors       = ["Eloy Espinaco", "Gastón Ramos"]
  spec.email         = ["eloyesp@gmail.com", "ramos.gaston@gmail.com"]
  spec.summary       = %q{Simple validated accessors for your simple classes.}
  spec.description   = %q{Help you discover errors early.}
  spec.homepage      = ""
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cutest"
end
