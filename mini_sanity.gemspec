require_relative "lib/mini_sanity/version"

Gem::Specification.new do |spec|
  spec.name          = "mini_sanity"
  spec.version       = MiniSanity::VERSION
  spec.authors       = ["Jonathan Hefner"]
  spec.email         = ["jonathan@hefner.pro"]

  spec.summary       = %q{In-line sanity checks}
  spec.homepage      = "https://github.com/jonathanhefner/mini_sanity"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.metadata["source_code_uri"] + "/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.start_with?("test/", ".git") }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
