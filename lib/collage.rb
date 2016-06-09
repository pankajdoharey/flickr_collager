# Collage is the main class that kicks off various code for searching,
# downloading and stitching together images to produce collage
class Collage
  attr_reader :search_words

  def initialize(words)
    create_and_clean_temp_directory
    @search_words = fill_missing words
  end

  def download_images
    pool = []
    Thread.new { animate_cursor }
    @search_words.each do |word|
      pool << Thread.new do
        search_and_save_flickr_image word
        print '..'
      end
    end
    pool.each(&:join)
    self
  end

  private

  def create_and_clean_temp_directory
    FileUtils.remove_dir(TEMP_DIR) if File.directory?(TEMP_DIR)
    FileUtils.mkdir(TEMP_DIR)
  end

  def fill_missing(words)
    if words.count < MIN_WORD_COUNT
      (MIN_WORD_COUNT - words.count).times { words << new_word }
    end
    words
  end

  def new_word
    word = DICTIONARY.sample
    if is_ascii?(word)
      word
    else
      puts "\nNon-Ascii Word Detected : #{word}. Retrying ..."
      new_word
    end
  end

  def is_ascii?(word)
    word.force_encoding('UTF-8').ascii_only?
  end

  def animate_cursor
    char = %w(| / - \\).cycle
    loop do
      print "\b\b"
      print " #{char.next}"
      sleep 0.05
    end
  end
end
