module AppConfig::PostInstall
  def self.message
    unless File.directory?(File.expand_path('~/.collage', __FILE__))
      FileUtils.mkdir(File.expand_path('~/.collage/'))
      FileUtils.cp('config.yaml', File.expand_path('~/.collage/config.yaml'))
      puts <<-MESSAGE
      A basic Yaml Configuration file has been copied to ~/.collage/config.yaml
      you modify that to change some setting.
      MESSAGE
    end
  end
end
