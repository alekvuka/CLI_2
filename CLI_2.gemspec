
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "CLI_2/version"

Gem::Specification.new do |spec|
  spec.name          = "CLI_2"
  spec.version       = CLI2::VERSION
  spec.authors       = ["'ALEKSANDAR VUKASINOVIC'"]
  spec.email         = ["'alekvuka@gmail.com'"]

  spec.summary       = %q{The framework of the gem is in CLI, Scraper and Provider classes with a Printer module. The CLI class initiates the user interaction and is responsible for interpreting user input and initiating the Scraper class. The Scraper class is responsible fir scraping the given website and instantiating Provider objects. The provider class is responsible for Provider objects each instance of has instance variables that account for the Provider attributes, such as name, qualifications, etc. The Printer module is responsible for outputting messages to the user, it contains methods such as “Main Menu” and “Warning Message.}
  spec.description   = %q{Scraping a health clinic website and organizing its providers/doctors}
  spec.homepage      = "https://github.com/alekvuka/CLI_2"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
#  if spec.respond_to?(:metadata)
#    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against " \
#      "public gem pushes."
#  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["run"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
