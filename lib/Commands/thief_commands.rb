module ThiefCommands
    def attempt_robbery house
      attempts = 0
      while attempts <= 100

        locked_status = house.isLocked?

        # Attempt to unlock
        unlocked = attempt_unlock house

        # Check for success
        if unlocked == true

          # Steal money
          money_stole = steal_money house

          # Log a message
          Events.robbery @name, house.owner, money_stole, locked_status

          puts "Successful Robbery ($" + money_stole.to_s + ")"

          return true
        end

        attempts +=  1
      end

      puts "Failed Robbery"
      Events.failed_robbery @name, house.owner + "'s House"
      return false

    end

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

    # Burn
    def burn_house house

      if (rand ARSONIST_BURN_CHANCE) == 1
        house.burn
        Events.burn @name, (house.owner or 'world')
        puts "Successfully burned down the house."
      else
        puts "Failed to burn down the house."
      end
      
    end
end
