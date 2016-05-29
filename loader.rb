['../lib'].each { |dir| $LOAD_PATH << File.expand_path(dir, __FILE__) }

require 'bundler/setup'
require 'collage'
