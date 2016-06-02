['../lib', '../lib/app_config'].each do |dir|
  $:<< File.expand_path(dir, __FILE__)
end

require 'yaml'
require 'net/http'
require 'json'
require 'fileutils'
require 'string_refinements'
require 'app_config'
require 'dictionary'
require 'collage'

class Collage
  include AppConfig
  include Options
  include Dictionary
  include FlickrSearch
  include MagickCollage
end
