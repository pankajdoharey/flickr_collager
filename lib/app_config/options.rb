module ::AppConfig::Options
  def self.set_options config
    config["options"].each do |key, val|
      case val
      when String
        self.class_eval("#{key}='#{val}'")
      else
        self.class_eval("#{key}=#{val}")
      end
    end
  end
end
