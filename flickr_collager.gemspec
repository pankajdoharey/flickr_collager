require_relative 'lib/string_refinements'
require_relative 'lib/app_config'
require 'fileutils'

Gem::Specification.new do |gem|
  gem.name          = "flickr_collager"
  gem.version       = ::AppConfig::VERSION
  gem.authors       = ["Pankaj Doharey"]
  gem.email         = ["pankajdoharey@gmail.com"]
  gem.licenses      = ['WTFPL']
  gem.description   = %q{Collage Builder}
  gem.summary       = %q{Flickr based Collage builder}
  gem.homepage      = "http://selfdotsent.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "rake", "11.1.2"
  gem.add_dependency "minitest", "5.9.0"
  gem.post_install_message = (
    unless File.directory?(File.expand_path("~/.collage", __FILE__))
      FileUtils.mkdir(File.expand_path("~/.collage/"))
    end
    FileUtils.cp("config.yaml", File.expand_path("~/.collage/config.yaml", __FILE__))
    puts %Q{
        A basic Yaml Configuration file has been copied to ~/.collage/config.yaml
        you modify that to change some setting.
        }
  )
end
