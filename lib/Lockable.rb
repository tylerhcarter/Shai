require 'Key.rb'

module Lockable

  @locked = false
  
  @key = ""

  def lock
    @locked = true
  end

  def unlock key

    # If already unlocked, we're good
    if @locked == false
      return true
    end

    # Random chance that the key just works
    num = rand 1000
    if num == 1
      @locked = false
      return true
    end

    # Check if key is valid
    if(@key.valid? key)
      @locked = false
      return true
    else
      return false
    end

  end

  def isLocked?
    return @locked
  end

  def getKey
    if !@key.respond_to? :getHash
      @key = Key.new( rand(100) )
      return @key
    else
      return false
    end
    
  end

end