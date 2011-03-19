module HouseCommands

    # Lockable Commands
    def unlock_house building
      building.unlock @key
      if building.isLocked?
        puts "The key did not work."
      else
        puts "They key worked!"
      end
    end

    def lock_house building
      building.lock
    end

    # Deposit/Withdraw Commands
    def deposit_house building
      # Find out how much you have
      on_hand = @money.total

      # Pick a random number to deposit
      to_deposit = rand(on_hand + 1)

      status = building.deposit_money to_deposit
      if status
        @money.subtract to_deposit
        Events.deposit(@name, building.owner + "'s House", to_deposit)
        puts "Successfully deposited money ($" + to_deposit.to_s + ")"
      else
        puts "Failed to deposit money"
      end
    end
end
