# frozen_string_literal: true

require_relative "lib/krails/version"

Gem::Specification.new do |spec|
  spec.name = "krails"
  spec.license = "MIT"
  spec.version = Krails::VERSION
  spec.authors = ["Andy B"]
  spec.email = ["andybarnov@gmail.com"]

  spec.summary = "A CLI for generating Rails-centric, opinionated Kubernetes deployment config"
  # spec.description = ""
  spec.homepage = "https://github.com/lewagon/krails"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # TODO: Lock them to last good versions
  spec.add_dependency "tty-which"
  spec.add_dependency "tty-command"
  spec.add_dependency "tty-logger"
  spec.add_dependency "anyway_config", ">= 2.0.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
