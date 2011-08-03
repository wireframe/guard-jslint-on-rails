# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/jslint-on-rails"

Gem::Specification.new do |s|
  s.name        = "guard-jslint-on-rails"
  s.version     = Guard::JslintOnRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@codecrate.com"]
  s.homepage    = ""
  s.summary     = %q{Guard Javascript changes to ensure JSLint complience}
  s.description = %q{Guard Javascript changes to ensure JSLint complience}

  s.rubyforge_project = "guard-jslint-on-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 0.4.0'
end
