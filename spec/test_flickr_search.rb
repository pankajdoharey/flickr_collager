require_relative '../loader'
require_relative 'spec_helper'

describe ::AppConfig::FlickrSearch do
  before do
    @collage = Collage.new(sample_10_words)
  end

  it "should be able to search flickr api for a given search term" do
    @collage.search_and_save_flickr_image( sample_10_words.pop )
  end

  it "should search flickr api with sample words and store all images" do
    @collage.download_images.get_image_list
  end
end
