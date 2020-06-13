
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identity_crm/version'

Gem::Specification.new do |spec|
  spec.name          = 'identity_crm'
  spec.version       = IdentityCRM::VERSION
  spec.authors       = ['Joel E. Svensson']
  spec.email         = ['joel.e.svensson@skiftet.org']
  spec.summary       = 'A gem for calling the Identity API'
  spec.homepage      = 'https://github.com/skiftet/identity-crm-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', ['~> 5.0', '~> 6.0']
  spec.add_dependency 'rest-client', ['>= 2.0', '< 3.0']
end
