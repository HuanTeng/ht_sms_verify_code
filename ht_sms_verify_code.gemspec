# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ht_sms_verify_code/version'

Gem::Specification.new do |spec|
  spec.name          = "ht_sms_verify_code"
  spec.version       = HtSmsVerifyCode::VERSION
  spec.authors       = ["delong"]
  spec.email         = ["w.del@qq.com"]
  spec.summary       = %q{SMS verify code.}
  spec.description   = %q{degpend on ht_sms.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
