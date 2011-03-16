class Key

  @key = ""

  def initialize hash
    num = rand 100
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

    if hash.getHash == @key
      return true
    else
      return false
    end
  end

end