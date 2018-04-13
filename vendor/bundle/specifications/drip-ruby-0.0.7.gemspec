# -*- encoding: utf-8 -*-
# stub: drip-ruby 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "drip-ruby".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Derrick Reimer".freeze]
  s.date = "2016-10-11"
  s.description = "A simple wrapper for the Drip API".freeze
  s.email = ["derrickreimer@gmail.com".freeze]
  s.homepage = "http://github.com/DripEmail/drip-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.3".freeze
  s.summary = "A Ruby gem for interacting with the Drip API".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<shoulda-context>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<shoulda-context>.freeze, ["~> 1.0"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<shoulda-context>.freeze, ["~> 1.0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
  end
end
