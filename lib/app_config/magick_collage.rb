module AppConfig
  module MagickCollage
    def self.options(config)
      config['imagemagick'].each do |key, val|
        const_set(key, val)
      end
    end

    def build(file = 'collage.jpg')
      crop_images
      system <<-COMMAND.gsub(/\s+|\n/, ' ')
        montage #{::AppConfig::FlickrSearch::TEMP_DIR}/cropped*.png
        -geometry #{IMG_SIZE / COLUMNS}x#{IMG_SIZE / COLUMNS}#{BORDR_SIZE}
        background #{BG_COLOR}
        -tile #{COLUMNS}x#{ROWS} #{file}
        2>/dev/null
      COMMAND
    end

    def crop_images
      system <<-COMMAND.gsub(/\s+|\n/, ' ')
        convert
        #{::AppConfig::FlickrSearch::TEMP_DIR}/*.jpg -gamma .45455
        -crop #{IMG_SIZE / COLUMNS}x#{IMG_SIZE / COLUMNS}+0+0 +repage
        -gamma 2.2 #{::AppConfig::FlickrSearch::TEMP_DIR}/cropped.png
        2>/dev/null
        COMMAND
    end
  end
end
