class Collage
  attr_reader :search_words

  def initialize(words)
    create_and_clean_temp_directory
    @search_words = fill_missing words
  end

  def download_images
    Thread.new { animate_cursor }
    @search_words.each do |word|
      Thread.new {
        search_and_save_flickr_image word
        print ".."
      }.join
    end
    self
  end

  private

  def create_and_clean_temp_directory
    FileUtils.remove_dir(TEMP_DIR) if File.directory?(TEMP_DIR)
    FileUtils.mkdir(TEMP_DIR)
  end

  def fill_missing(words)
    if words.count < MIN_WORD_COUNT
      (MIN_WORD_COUNT - words.count).times do
        words << get_new_word
      end
    end

    words
  end

  def get_new_word
    begin
      word = @@dictionary.sample
      if word.force_encoding("UTF-8").ascii_only?
        word
      else
        puts "\nRetrying Non-Ascii Word Detected : #{word}"
        raise
      end
    rescue
      retry
    end
  end

  def animate_cursor
    char = %w(| / - \\).cycle
    loop {
      print "\b\b"
      print " #{char.next}"
      sleep 0.05
    }
  end
end
