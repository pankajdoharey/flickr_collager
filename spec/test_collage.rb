require_relative '../loader'
require_relative 'spec_helper'

describe Collage do
  before do
    @collage = Collage.new(sample_10_words)
  end
  it 'should be able to read the words as commandline options and store them' do
    @collage.search_words.count.must_equal 10
  end

  it 'should have 10 exact words in ARGV' do
    @collage.search_words.must_equal ARGV[0..9]
  end

  it 'should verify the search wordcount and add 2 more words if required' do
    @collage = Collage.new(sample_8_words)
    @collage.search_words.count.must_equal 10
  end

  it 'should verify the search wordcount and add 5 more words if required' do
    @collage = Collage.new(sample_5_words)
    @collage.search_words.count.must_equal 10
  end

  it 'should verify the search wordcount and add 8 more words if required' do
    @collage = Collage.new(sample_2_words)
    @collage.search_words.count.must_equal 10
  end
end
