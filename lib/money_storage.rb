require 'record'

class MoneyStorage

  attr_reader :owner

  @amount = 0
  @owner
  def initialize owner, amount = 0
    @amount = amount
    @owner = owner
  end

  def add amount
    @amount = @amount.to_i + amount.to_i
    return Record.new amount, "deposit"
  end

  def subtract amount
    @amount = @amount.to_i - amount.to_i
    return Record.new amount, "withdraw"
  end

  def total
    return @amount
  end

end
