class Bank
  @amount = 0
  def initialize owner, amount = 0
    @amount = amount
    @owner = owner
  end

  def add amount
    @amount = @amount.to_i + amount.to_i
  end

  def subtract amount
    @amount = @amount.to_i - amount.to_i
  end

  def total
    return @amount
  end

end
