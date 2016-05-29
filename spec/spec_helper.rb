require_relative '../loader'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride' #Colorful tests

# def read_stdin
#   stdin = $stdin
#   $stdin, write = IO.pipe
#   yield write
# ensure
#   write.close
#   $stdin = stdin #restore
# end

def sample_10_words
  ARGV[0..9] = "cat", "dog", "crow", "cow", "elephant",
  "tree_snake", "women", "red", "tower", "beach"
end
