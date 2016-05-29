class Collage
  attr_reader :search_words

  def initialize(words)
    @search_words = build_search words
  end

  private

  def build_search words
    if words.count < MIN_WORD_COUNT
      (MIN_WORD_COUNT - words.count).times do
        words << @@dictionary.sample
      end
    end

    words
  end
end
