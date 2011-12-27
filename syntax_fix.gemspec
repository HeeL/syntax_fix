# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "syntax_fix/version"

Gem::Specification.new do |s|
  s.name        = "syntax_fix"
  s.version     = SyntaxFix::VERSION
  s.authors     = ["Sergey Parizhskiy"]
  s.email       = ["parizhskiy@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Replace Ruby 1.8 syntax with the modern one}
  s.description = %q{Replace Ruby 1.8 syntax with the Ruby 1.9 syntax all over the project}

  s.rubyforge_project = "syntax_fix"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
