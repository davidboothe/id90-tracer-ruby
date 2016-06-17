# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'id90_tracer/version'

Gem::Specification.new do |spec|
  spec.name          = "id90_tracer"
  spec.version       = Id90Tracer::VERSION
  spec.authors       = ["Chris Bankston"]
  spec.email         = ["chris.bankston@id90travel.com"]

  spec.summary       = %q{Request ID Tracing for Ruby Applications}
  spec.description   = %q{Tracks multiple request ids}
  spec.homepage      = "https://www.id90travel.com"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rack", ">= 1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
