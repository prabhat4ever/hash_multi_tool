# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_multi_tool/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_multi_tool"
  spec.version       = HashMultiTool::VERSION
  spec.authors       = ["Prabhat Thapa"]
  spec.email         = ["prabhat_thapa@external.mckinsey.com"]

  spec.summary       = %q{Sort a array of hashes with one or multiple values}
  spec.description   = %q{Sort a array of hashes with one or multiple values}
  spec.homepage      = "https://github.com/prabhat4ever/hash_multi_tool/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
