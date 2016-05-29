module ::AppConfig::Options
  def self.set_options config
    config["options"].each {|k, v| self.class_eval("#{k}=#{v}")}
  end
end
