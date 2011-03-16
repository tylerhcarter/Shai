class Thief < Person

  @max_attempts = 100
  
  def initialize name, house, attempts = 100
    super name, house
    @max_attempts = attempts
  end

  def act house

    # First, act like a regular person
    super house

    # Try to break in if it isn't your house
    breakin house if !is_mine? house
    
  end

  def breakin house
    
    attempts = 0
    while attempts < @max_attempts

      # Attempt to unlock
      unlocked = attempt_unlock house

      # Check for success
      if unlocked == true

        # Steal money
        steal_money house

        # Log a message
        puts @name + " broke into " + house.owner + "'s house in " + attempts.to_s + " attempts."
        
        return true
      end

      attempts +=  1
    end

    puts @name + " failed to break into " + house.owner + "'s house."
    return false

  end

  private

  # Attempts to break in by creating a key
  def attempt_unlock house

    # Create a new key
    key = Key.new( rand(100) )

    # Attempt to break in
    if house.unlock key
      return true
    else
      return false
    end

  end

  def steal_money house

    # Check if the house is locked
    if !house.isLocked?

      # Withdraw all the money from the house if there is any
      @money.add house.withdraw_all if house.money.total > 0
      
    end
    
  end

end