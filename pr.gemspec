# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pr/version"

Gem::Specification.new do |s|
  s.name        = "pr"
  s.version     = PR::VERSION
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "https://github.com/JonRowe/PR"
  s.summary     = %q{Public Relations tools for Rails}
  s.description = %q{Form and Presenter libraries for interfacing the public with Rails}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
  if RUBY_VERSION < '2.2.2'
    s.add_development_dependency 'activemodel', '< 5'
  else
    s.add_development_dependency 'activemodel'
  end

end
