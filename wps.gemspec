
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wps/version"

Gem::Specification.new do |spec|
  spec.name          = "wps-sdk"
  spec.version       = Wps::VERSION
  spec.authors       = ["David Ding"]
  spec.email         = ["cod7ce@gmail.com"]

  spec.summary       = %q{WPS API SDKs for ruby}
  spec.description   = %q{WPS API SDKs for ruby https://open.wps.cn/}
  spec.homepage      = "https://github.com/mycolorway/wps-ruby-sdk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'http', '>= 2.2'
  spec.add_dependency 'activesupport', '>= 5.0'
  spec.add_dependency 'redis'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
