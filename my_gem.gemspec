
require File.expand_path('../lib/my_gem/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "my_gem"
  s.version     = MyGem.version
  s.authors     = ["John Q. Public"]
  s.email       = ["john.q.public@yourcompany.com"]
  s.summary     = %q{Your summary here}
  s.description = %q{Your description here}

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map {|f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # Your dependencies here
end

