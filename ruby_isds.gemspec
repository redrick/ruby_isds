lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_isds/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_isds"
  spec.version       = RubyIsds::VERSION
  spec.authors       = ["Andrej Antas"]
  spec.email         = ["andrej@antas.cz"]

  spec.summary       = %q{Ruby client to access ISDS}
  spec.description   = %q{Ruby client to access available SOAP services of ISDS (CZ datovka)}
  spec.homepage      = "https://uol.cz"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
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

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'simplecov', '~> 0.14'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.0'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'timecop'

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'activesupport'
end
