module AppConfig
  using Camelizer

  def self.included(_klass)
    base = self
    config = YAML.load_file(path_finder)

    Dir.glob File.expand_path('../app_config/*.rb', __FILE__) do |file|
      require file

      # Set app configration from config.yaml
      base_name = File.basename(file, '.rb')
      (base.const_get base_name.camelize).set_options config
    end
  end

  def self.path_finder
    if File.exist?('config.yaml')
      'config.yaml'
    else
      File.expand_path('~/.collage/config.yaml', __FILE__)
    end
  end
end

require_relative 'version'
require_relative 'post_install'
