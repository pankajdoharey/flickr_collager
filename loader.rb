['../lib', '../lib/app_config'].each do |dir|
  $:<< File.expand_path(dir, __FILE__)
end

require 'bundler/setup'
require 'yaml'
require 'app_config'
require 'dictionary'
require 'collage'

class Collage
  include AppConfig
  include Options
  include Dictionary
end

