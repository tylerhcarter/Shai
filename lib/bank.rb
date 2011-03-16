class Bank
  @amount = 0
  def initialize owner, amount = 0
    @amount = amount
    @owner = owner
  end

  def add amount
    @amount = @amount.to_i + amount.to_i
    puts @owner + " deposited " + amount.to_s
  end

  def subtract amount
    @amount = @amount.to_i - amount.to_i
    puts @owner + " withdrew " + amount.to_s
  end

  def total
    return @amount
  end

end
