# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dropbox-api/version"

Gem::Specification.new do |s|
  s.name        = "dropbox-api"
  s.version     = Dropbox::API::VERSION
  s.authors     = ["Rafaela"]
  s.email       = ["opensource@rafaela.com"]
  s.homepage    = "http://github.com/futuresimple/dropbox-api"
  s.summary     = "A Ruby client for the Dropbox REST API."
  s.description = "To deliver a more Rubyesque experience when using the Dropbox API."
  s.license     = 'Apache License Version 2.0'

  s.rubyforge_project = "dropbox-api"

  s.add_dependency 'multi_json', '~> 1.10'
  s.add_dependency 'oauth', '~> 0.4.7'
  s.add_dependency 'hashie', '~> 3.4.0'

  s.add_development_dependency 'rspec','2.14.1'
  s.add_development_dependency 'rake', '10.1.0'
  s.add_development_dependency 'simplecov', '~> 0.8.2'
  s.add_development_dependency 'yajl-ruby', '~> 1.2.0'

  if RUBY_VERSION < "1.9"
    s.add_development_dependency 'ruby-debug19'
  end

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end