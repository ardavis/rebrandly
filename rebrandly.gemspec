# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rebrandly/version'

Gem::Specification.new do |spec|
  spec.name          = "rebrandly"
  spec.version       = Rebrandly::VERSION
  spec.authors       = ["Andrew Davis"]
  spec.email         = ["andrew@andrewrdavis.net"]

  spec.summary       = "A Ruby Rebrandly Wrapper"
  spec.description   = "Easily use Rebrandly's HTTP API using this gem."
  spec.homepage      = "https://github.com/ardavis/rebrandly"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'httparty', '~> 0.14'
end
