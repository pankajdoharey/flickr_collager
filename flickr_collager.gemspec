require_relative 'lib/string_refinements'
require_relative 'lib/app_config'

Gem::Specification.new do |gem|
  gem.name          = "flickr_collager"
  gem.version       = ::AppConfig::VERSION
  gem.authors       = ["Pankaj Doharey"]
  gem.email         = ["pankajdoharey@gmail.com"]
  gem.description   = %q{Collage Builder}
  gem.summary       = %q{Flickr based Collage builder}
  gem.homepage      = "http://selfdotsent.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "rake", "~> 11.1.2"
  gem.add_dependency "minitest", "~> 5.9.0"
end
