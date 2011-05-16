require "./lib/renvy"
Gem::Specification.new do |s|
  s.name = "renvy"
  s.version = REnvy.version
  s.summary = "RSpec-like syntax for Test::Unit."
  s.description = "REnvy lets you use a syntax similar to RSpec on your Test::Unit tests."
  s.authors = ["Rico Sta. Cruz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = "http://github.com/rstacruz/renvy"
  s.files = Dir["{bin,lib,test}/**/*", "*.md", "Rakefile"].reject { |f| File.directory?(f) }

  s.add_dependency "test-unit"
end
