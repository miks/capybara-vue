# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/vue/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-vue"
  spec.version       = Capybara::Vue::VERSION
  spec.authors       = ["Woowa Brothers"]
  spec.email         = ["ahastudio@gmail.com"]
  spec.description   = %q{Capybara API that knows how to wait for Vue.js in end to end specs}
  spec.summary       = %q{Stable Capybara API for Vue.js applications}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capybara'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
