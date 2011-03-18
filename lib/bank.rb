require 'building'
require 'money_storage'
require 'events'

module Building
  class Bank < Building

    @money

    def initialize
      @money = MoneyStorage.new "World", 0
    end

    def deposit amount
      @money.add amount
    end

    def total
      return @money.total
    end

  end
end
