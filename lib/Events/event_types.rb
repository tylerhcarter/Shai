module EventTypes
  class Event
    attr_reader :action, :player, :target

    @action
    @player
    @target

    def initialize action, player, target
      @action = action
      @player = player
      @target = target
    end

  end

  class PayEvent < Event
    attr_reader :amount
    @amount

    def initialize player, target, amount
      super "pay", player, target
      @amount = amount
    end
  end

  class DepositEvent < Event
    attr_reader :amount
    @amount

    def initialize player, target, amount
      super "deposit", player, target
      @amount = amount
    end
  end

  class WithdrawEvent < Event
    attr_reader :amount
    @amount

    def initialize player, target, amount
      super "withdraw", player, target
      @amount = amount
    end
  end

  class RobberyEvent < Event
    attr_reader :amount
    @amount

    def initialize player, target, amount
      super "robbery", player, target
      @amount = amount
    end
  end

  class CounterfeitEvent < Event
    attr_reader :amount
    @amount

    def initialize player, target, amount
      super "counterfeit", player, target
      @amount = amount
    end
  end

  class FailedRobberyEvent < Event
    def initialize player, target
      super "failed_robbery", player, target
    end
  end

  class ArsonEvent < Event
    def initialize player, target
      super "arson", player, target
    end
  end
end
