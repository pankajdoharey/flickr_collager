require_relative '../loader'
require_relative 'spec_helper'

describe ::AppConfig::MagickCollage do
  before do
    @collage = Collage.new( sample_5_words )
  end

  it "should crop the images" do
    @collage.download_images
    @collage.crop_images
    @collage.get_image_list.select{|i| i =~ /cropped/}.count.must_equal 10
  end
end
