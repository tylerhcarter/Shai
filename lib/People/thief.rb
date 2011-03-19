module People
  class Thief < Person

    @max_attempts = THIEF_MAX_ATTEMPTS

    def initialize name, house, key, attempts = THIEF_MAX_ATTEMPTS
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
          money_stole = steal_money house

          # Log a message
          Events.robbery @name, house.owner, money_stole, locked_status

          return true
        end

        attempts +=  1
      end

      Events.failed_robbery @name, house.owner + "'s House"
      return false

    end

    private

    # Attempts to break in by creating a key
    def attempt_unlock house

      # Create a new key
      key = Key.new( rand(THIEF_BREAKIN_KEY_SEED) )

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
        money_stole = house.money.total
        @money.add house.withdraw_all if house.money.total > 0

        return money_stole

      end

    end

  end
end