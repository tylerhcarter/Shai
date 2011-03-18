class Bank < Building

  @money

  def initialize
    @money = MoneyStorage.new "World", 0
  end

  def deposit amount, account

    @money.add amount
    Events.deposited(account, "Bank", amount)

  end

  def total
    return @money.total
  end

end
