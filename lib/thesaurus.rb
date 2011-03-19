class Thesaurus
  @words
  def initialize
    @words = Array.new
  end

  def add_word word, *synonyms
    obj = Word.new word
    @words.push obj

    synonyms.each{
      |synonym|
      obj.add synonym
    }
    return obj
  end

  def add_synonym word, synonym
    obj = get_word word
    obj.add synonym if obj.class == "Word"
  end

  def get_word word
    @words.each{
      |obj|
      if obj.base_word == word
        return obj
      end
    }
    return add_word word
  end

  def has_word? word
     @words.each{
      |obj|
      if obj.base_word == word
        return true
      end
    }
    return false
  end

  def get_base_word synonym
    @words.each{
      |base_word|
      if base_word.has_synonym? synonym
        return base_word.base_word
      end
    }
    return false
  end

  class Word
    attr_reader :base_word

    @base_word
    @synonyms
    def initialize word
      @base_word = word
      @synonyms = Array.new

      # The base word is a synonym of the base word
      add @base_word
    end

    def add synonym
      @synonyms.push synonym
    end

    def has_synonym? word
      @synonyms.each{
        |synonym|

        if synonym == word
          return true
        end
      }
      
      return false
    end
  end
end
