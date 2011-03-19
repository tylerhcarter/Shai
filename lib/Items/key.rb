require 'settings'

class Key

  @key = ""
  @seed = REGULAR_KEY_SEED

  def initialize hash
    num = rand @seed
    @key = hash.to_s + num.to_s
  end

  def getHash
    return @key
  end

  # Determines if the key is valid
  def valid? hash
    
    if !hash.respond_to? :getHash
      raise "Key::Hash must recieve a key as a parameter"
    end

    # Random chance that the key just works
    num = rand REGULAR_KEY_FAILURE_CHANCE
    if num == 1
      return true
    end

    if hash.getHash == @key
      return true
    else
      return false
    end
  end

end