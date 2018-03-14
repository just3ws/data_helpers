# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_helpers'
  spec.version       = DataHelpers::VERSION
  spec.authors       = ['Mike Hall']
  spec.email         = %w(mike@just3ws.com)

  spec.summary       = 'Helpers to generate data for coding exercises'
  spec.description   = 'Generates various delimited files for use in coding exercises'
  spec.homepage      = 'https://github.com/just3ws/data_helpers'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://push.not.allowed.to.any.host.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'faker', '~> 1.8.7'
end
