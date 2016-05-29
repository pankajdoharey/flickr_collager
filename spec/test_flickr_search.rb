require_relative '../loader'
require_relative 'spec_helper'

describe FlickrSearch do
  it "should be read the keywords and search them on flickr" do
    @flickr.read
    @flickr.words.length.must_equal 10
  end
end
