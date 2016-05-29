require_relative '../loader'
require_relative 'spec_helper'

describe Collage do
  it "should be able to read the words from commandline and store them" do
    @collage = Collage.new(sample_10_words)
    @collage.search_words.length.must_equal 10
  end

  it "should have 10 exact words in ARGV" do
    @collage = Collage.new(sample_10_words)
    @collage.search_words.must_equal ARGV[0..9]
  end
end
