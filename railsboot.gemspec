require_relative "lib/railsboot/version"

Gem::Specification.new do |spec|
  spec.name        = "railsboot"
  spec.version     = Railsboot::VERSION
  spec.authors     = ["Daniel Schoppmann", "Victor Cobos"]
  spec.email       = ["daniel.schoppmann@dotruby.com", "victor.cobos@dotruby.com"]
  spec.homepage    = "https://railsbootui.com"
  spec.summary     = "Rails View Components for Bootstrap"
  # spec.description = "TODO: Description of Railsboot."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dotruby/railsboot"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_runtime_dependency "rails", ">= 7.1"
  spec.add_runtime_dependency "view_component", ">= 3.0.0", "< 4.0.0"

  spec.add_development_dependency "minitest", "~> 5.0"
end
