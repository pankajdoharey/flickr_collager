module AppConfig
  module Dictionary
    def self.included(klass)
      klass.const_set(:DICTIONARY, File.read(klass::DICT_PATH).split("\n"))
    end
  end
end
