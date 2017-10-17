
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regaliator/version'

Gem::Specification.new do |spec|
  spec.name          = 'regaliator'
  spec.version       = Regaliator::VERSION
  spec.authors       = ['Hesham El-Nahhas', 'Leigh Halliday',
                        'Geoffrey Roguelon', 'Romario Lopez']
  spec.email         = ['hesham@regalii.com', 'leigh@regalii.com',
                        'geoffrey@regalii.com', 'romario@regalii.com']
  spec.summary       = "Ruby wrapper for Regalii's API"
  spec.description   = "A Ruby client for consuming Regalii's APIs."
  spec.homepage      = 'https://www.regalii.com/api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = ['>= 2.1.0', '< 2.5']

  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler',            '~> 1.7'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1', '>= 1.1.13'
  spec.add_development_dependency 'minitest',           '~> 5.8', '>= 5.8.4'
  spec.add_development_dependency 'rake',               '~> 10.0'
  spec.add_development_dependency 'vcr',                '~> 2.9', '>= 2.9.3'
  spec.add_development_dependency 'webmock',            '~> 1.19'
  spec.add_development_dependency 'pry'
end
