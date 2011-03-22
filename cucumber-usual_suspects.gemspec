# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'cucumber-usual_suspects'
  s.version     = '0.0.1'
  s.authors     = ["Matt Wynne"]
  s.description = 'Identities for Cucumber step definitions'
  s.summary     = "cucumber-usual_suspects-#{s.version}"
  s.email       = 'matt@mattwynne.net'
  s.homepage    = "http://github.com/mattwynne/cucumber-usual_suspects"

  s.platform    = Gem::Platform::RUBY
  s.add_dependency 'cucumber', '~> 0.10.2'
  s.add_development_dependency 'aruba'

  s.rubygems_version   = "1.4.2"
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
