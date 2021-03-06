# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exotel_api/version'

Gem::Specification.new do |spec|
  spec.name          = "exotel_api"
  spec.version       = ExotelApi::VERSION
  spec.authors       = ["Aashutosh Chaudhary"]
  spec.email         = ["ashugodia@gmail.com"]

  spec.summary       = %q{Exotel Call API}
  spec.description   = %q{To use exotel call api}
  spec.homepage      = "https://github.com/ashugodia/exotel-api.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '>= 1.14', '<= 1.16'
  spec.add_development_dependency 'rake', '>= 10.0', '<= 12.3'
  spec.add_dependency "httparty", '~> 0.14.0'
  spec.add_runtime_dependency 'rails', '>= 4.1', '<= 5.2'
  spec.add_runtime_dependency 'activesupport', '>= 4.1', '<= 5.2'
end
