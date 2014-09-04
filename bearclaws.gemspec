# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bearclaws/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Kyle Truscott"]
  gem.email       = ["keighl@keighl.com"]
  gem.description = %q{Analyze the output of you AWS cost allocation report. Group your costs by an arbitrary tag, like `client`}
  gem.summary     = %q{Analyze the output of you AWS cost allocation report. Group your costs by an arbitrary tag, like `client`}
  gem.homepage    = "https://github.com/keighl/bearclaws"
  gem.license     = 'MIT'

  gem.files         = [
    "lib/bearclaws.rb",
    "lib/bearclaws/version.rb",
    "lib/bearclaws/charge.rb",
    "lib/bearclaws/group.rb",
    "lib/bearclaws/mapping.rb"
  ]

  gem.executables   = %w{bearclaws}

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bearclaws"
  gem.require_paths = ["lib"]
  gem.version       = Bearclaws::VERSION

  gem.add_development_dependency('rspec', '2.14.1')
  gem.add_development_dependency('guard-rspec')
  gem.add_development_dependency('rb-fsevent')
  gem.add_development_dependency('rb-inotify')
  gem.add_development_dependency('yard')
  gem.add_development_dependency('redcarpet')
  gem.add_development_dependency('rake')
end