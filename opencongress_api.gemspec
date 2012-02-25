# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "opencongress_api/version"

Gem::Specification.new do |s|
  s.name        = "OpenCongressAPI"
  s.version     = OpencongressApi::VERSION
  s.authors     = ["Jason Berlinsky"]
  s.email       = ["jason@jasonberlinsky.com"]
  s.homepage    = "http://www.jasonberlinsky.com/"
  s.summary     = %q(A wrapper for the OpenCongress API)
  s.description = %q(An easy to use wrapper for the OpenCongress API)

  s.rubyforge_project = "opencongress_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client"
end
