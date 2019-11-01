lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/rain_jackets/version"

Gem::Specification.new do |spec|
  spec.name          = "rain_jackets"
  spec.version       = RainJackets::VERSION
  spec.authors       = ["'Jacqueline Lam'"]
  spec.email         = ["'jacqueline.karin.lam@gmail.com'"]

  spec.summary       = "CLI for best rain jackets"
  spec.description   = "Get the details for 2019's best rain jackets from Outdoor Gear Lab."
  spec.homepage      = "https://rubygems.org/profiles/jacqueline-lam"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ["lib/rain_jackets/scraper.rb", "lib/rain_jackets/jacket.rb", "lib/rain_jackets/cli.rb", "lib/rain_jackets/version.rb", "config/environment.rb"]
    # Dir.chdir(File.expand_path('..', __FILE__)) do
    #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
    # end
  spec.bindir        = "bin"
  spec.executables   << "rain_jackets"
  #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
