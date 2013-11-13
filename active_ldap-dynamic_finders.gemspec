# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_ldap/dynamic_finders/version'

Gem::Specification.new do |spec|
  spec.name          = "active_ldap-dynamic_finders"
  spec.version       = ActiveLdap::DynamicFinders::VERSION
  spec.authors       = ["Christian Nennemann"]
  spec.email         = ["christian.nennemann@gmail.com"]
  spec.description   = %q{ActiveLdap dynamic finders}
  spec.summary       = %q{Adds dynamic finder methods to ActiveLdap}
  spec.homepage      = "https://github.com/XORwell/activeldap-dynamic_finders"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0.1"
  spec.add_dependency "activeldap", ">= 4.0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "github-ldap"
  spec.add_development_dependency "ladle"
end
