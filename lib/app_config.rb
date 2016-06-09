module AppConfig
  using Camelizer

  def self.included(klass)
    config = YAML.load_file(path_finder)

    Dir.glob File.expand_path('../app_config/*.rb', __FILE__) do |file|
      require file

      # Set app configration from config.yaml
      file_basename = File.basename(file, '.rb')
      (klass.const_get file_basename.camelize).options config
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
