module AppConfig::Options
  def self.options(config)
    config['options'].each do |key, val|
      const_set(key, val)
    end
  end
end
