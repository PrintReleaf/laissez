# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'laissez/version'

Gem::Specification.new do |spec|
  spec.name          = "laissez"
  spec.version       = Laissez::VERSION
  spec.authors       = ["Casey O'Hara"]
  spec.email         = ["cohara@printreleaf.com"]
  spec.summary       = "Lazy accessors, yo."
  spec.description   = "Adds `lazy_accessor`, `lazy_reader`, and `lazy_writer` to the Module class.
                        Behaves just like its `attr_*` counterparts, except if the value is a Proc,
                        the return value of calling the proc is returned instead."

  spec.homepage      = "https://github.com/printreleaf/laissez"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end

