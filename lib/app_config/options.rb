module ::AppConfig::Options
  def self.set_options config
    config["options"].each do |key, val|
      self.const_set(key, val)
    end
  end
end
