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

    # Check if key is valid
    if(@key.valid? key)
      @locked = false
      return true
    else
      return false
    end

  end

  def isLocked?
    @locked = false if @locked.nil?
    return @locked
  end

  def setKey key
    if @key.respond_to? :getHash
      return false
    else
      @key = key
      return true
    end
  end

end