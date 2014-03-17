# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mayhem/version'

Gem::Specification.new do |spec|
  spec.name          = 'mayhem'
  spec.version       = Mayhem::VERSION
  spec.authors       = ['Matthew Hassfurder']
  spec.email         = ['sephonicus@gmail.com']
  spec.description   = 'Mayhem is a tool for sowing discord amongst your textual data.'
  spec.summary       = 'Mayhem.'
  spec.homepage      = 'https://github.com/sephonicus/mayhem'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
