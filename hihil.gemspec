# frozen_string_literal: true

require_relative "lib/nihil/version"

Gem::Specification.new do |spec|
  spec.name = "nihil"
  spec.version = Nihil::VERSION
  spec.authors = ["nichol alexander"]
  spec.email = ["nichol.alexander@gmail.com"]

  spec.summary = "The goal of this gem is to return nil."
  spec.description = "Nihil is a gem that returns nil."
  spec.homepage = "https://github.com/nicholalexander/nihilist"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nicholalexander/nihilist"
  spec.metadata["changelog_uri"] = "https://github.com/nicholalexander/nihilist/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end