# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid-numericid/version'

Gem::Specification.new do |gem|
  gem.name          = "mongoid-numericid"
  gem.version       = Mongoid::Numericid::VERSION
  gem.authors       = ["Kyle Dayton"]
  gem.email         = ["kdayton@graphicflash.com"]
  gem.description   = "Adds incremental numeric id supoort to Mongoid documents."
  gem.summary       = "Adds incremental numeric id supoort to Mongoid documents."
  gem.homepage      = "http://github.com/kdayton-/mongoid-numericid"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "mongoid", "~>3.0"
end
