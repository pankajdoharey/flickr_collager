module ::AppConfig::MagickCollage
  def self.set_options config
    config["minimagick"].each do |key, val|
      self.const_set(key, val)
    end
  end
end
