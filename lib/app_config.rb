module AppConfig
  def self.included(klass)
    base = self
    config = YAML::load_file("config.yaml")

    Dir.glob File.expand_path("../app_config/*.rb" , __FILE__) do |file|
      require file

      #Set app configration from config.yaml
      base_name = File.basename(file, ".rb")
      (base.const_get base_name.capitalize).set_options(config)
    end
  end
end