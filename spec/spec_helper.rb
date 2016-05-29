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

def sample_8_words
  ARGV[0..7] = "cat", "dog", "crow", "cow", "elephant",
  "tree_snake", "women", "red"
end

def sample_5_words
  ARGV[0..5] = "cat", "dog", "crow", "cow", "elephant"
end

def sample_2_words
  ARGV[0..1] = "cat", "dog"
end
