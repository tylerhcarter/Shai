require 'settings'
require 'person'

module People
  class Counterfeit < Person

    @max_attempts = 10

    def initialize name, house, key, attempts = 100
      super name, house, key
      @max_attempts = attempts
    end

    def act house

      # First, act like a regular person
      super house

      # Check if it is a house
      if house.respond_to? :unlock

        # Try to break in if it isn't your house
        breakin house if !is_mine? house
        
      end

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
          moneyAdded = counterfeit_money house

          # Log a message
          Events.counterfeit @name, house.owner, moneyAdded, locked_status

          return true
        end

        attempts +=  1
      end

      Events.failed_robbery @name, house.owner
      return false

    end

    private

    # Attempts to break in by creating a key
    def attempt_unlock house

      # Create a new key
      key = Key.new( rand(COUNTERFEIT_BREAKIN_KEY_SEED) )

      # Attempt to break in
      if house.unlock key
        return true
      else
        return false
      end

    end

    def counterfeit_money house

      # Check if the house is locked
      if !house.isLocked?

        # Get a random number of money
        money_added = rand COUNTERFEIT_MAX_CREATE
        house.money.add money_added

        return money_added

      end

    end

  end
end