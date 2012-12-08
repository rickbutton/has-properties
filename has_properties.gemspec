# -*- encoding: utf-8 -*-
require File.expand_path('../lib/has_properties/version', __FILE__)
require File.expand_path('../lib/has_properties', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rick Button"]
  gem.email         = ["me@rickybutton.com"]
  gem.description   = %q{Gem that provides an easy way to create basic objects with properties}
  gem.summary       = %q{Gem that provides an easy way to create basic objects with properties}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "has_properties"
  gem.require_paths = ["lib"]
  gem.version       = HasProperties::VERSION
  
  %w(rspec rake).each do |g|
    gem.add_development_dependency g
  end
end
