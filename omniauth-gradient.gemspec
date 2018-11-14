# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/gradient/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-gradient"
  spec.version       = Omniauth::Gradient::VERSION
  spec.authors       = ["David Stuckmann"]
  spec.email         = ["david@retireup.com"]

  spec.summary       = %q{An OmniAuth gem for Gradient}
  spec.homepage      = "https://github.com/retireupinc/omniauth-gradient"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency 'omniauth', '~> 1.6'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
end
