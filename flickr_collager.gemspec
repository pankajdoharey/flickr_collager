require_relative 'lib/string_refinements'
require_relative 'lib/app_config'
require 'fileutils'

Gem::Specification.new do |gem|
  gem.name          = 'flickr_collager'
  gem.version       = AppConfig::Version::STRING
  gem.authors       = ['Pankaj Doharey']
  gem.email         = ['pankajdoharey@gmail.com']
  gem.licenses      = ['WTFPL']
  gem.description   = 'Collage Builder'
  gem.summary       = 'Flickr based Collage builder'
  gem.homepage      = 'http://selfdotsend.com'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_dependency 'rake', '11.1.2'
  gem.add_dependency 'minitest', '5.9.0'
  gem.post_install_message = AppConfig::PostInstall::message
end
