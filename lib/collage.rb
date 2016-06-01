class Collage
  attr_reader :search_words

  def initialize(words)
    create_and_clean_temp_directory
    @search_words = fill_missing words
  end

  def download_images
    char = %w[| / - \\].cycle
    @search_words.each do |word|
      print "\b"
      search_and_save_flickr_image word
      print char.next
    end
    print "\b."
    self
  end

  private

  def create_and_clean_temp_directory
    if File.directory?(TEMP_DIR)
      FileUtils.remove_dir(TEMP_DIR)
    end
    FileUtils.mkdir(TEMP_DIR)
  end

  def fill_missing words
    if words.count < MIN_WORD_COUNT
      (MIN_WORD_COUNT - words.count).times do
        words << @@dictionary.sample
      end
    end

    words
  end
end
