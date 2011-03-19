require 'Buildings/enterable'
require 'Buildings/lockable'
require 'Buildings/burnable'

module Building
  class House
    include Enterable
    include Lockable
    include Burnable

    attr_accessor :owner, :money
    @owner = "";
    @money

    def initialize owner
      @owner = owner;
      @money = MoneyStorage.new @owner + "'s House", 0
    end

    def deposit_money amount

      if isLocked? == false
        @money.add amount
        return true
      else
        return false
      end

    end

    def withdraw_money amount

      if isLocked? == false
        @money.subtract amount
        return amount.to_i
      else
        return false
      end

    end

    def withdraw_all

      if isLocked? == false
        total = @money.total.to_i
        @money.subtract total
        return total
      else
        return false
      end

    end

  end
end