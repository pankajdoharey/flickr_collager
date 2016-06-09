module AppConfig
  module Dictionary
    def self.included(_klass)
      @@dictionary = File.read(::AppConfig::Options::DICT_PATH).split("\n")
    end
  end
end
