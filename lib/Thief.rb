class Thief < Person

  @max_attempts = 100
  
  def initialize name, house, key, attempts = 100
    super name, house, key
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
    while attempts <= @max_attempts

      locked_status = house.isLocked?

      # Attempt to unlock
      unlocked = attempt_unlock house

      # Check for success
      if unlocked == true

        # Steal money
        moneyStole = steal_money house

        # Log a message
        Events.stole @name, house.owner, moneyStole, locked_status
        
        return true
      end

      attempts +=  1
    end

    Events.fail_steal @name, house.owner
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
      moneyStole = house.money.total
      @money.add house.withdraw_all if house.money.total > 0

      return moneyStole
      
    end
    
  end

end