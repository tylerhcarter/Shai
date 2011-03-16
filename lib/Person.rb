class Person

  attr_accessor :name, :money, :house

  @name = ""
  @key = ""
  @money
  @house

  def initialize name, house, key
    @name = name

    if !house.respond_to? :lock
      raise "Person::Initalize must recieve a house as a #2 parameter"
    end

    @key = key
    house.lock

    @house = house

    @money = Bank.new name, 100

  end

  def act house

    if !is_mine? house
      return
    end

    if !house.respond_to? :unlock
      raise "Person::Act must recieve a house as a parameter"
    end

    # Unlock the house, add money, and lock
    house.unlock @key

    # Deposit money

    # Find out how much you have
    on_hand = @money.total

    # Pick a random number to deposit
    to_deposit = rand on_hand

    house.deposit_money to_deposit
    @money.subtract to_deposit
    Events.deposited(@name, house.owner + "'s House", to_deposit)

    # Random chance he forgets to lock the house
    num = rand 100
    if num > 1
      house.lock
    end

  end

  def retrieve_money
    
    @house.unlock @key
    @money.add @house.withdraw_all if @house.money.total > 0
    @house.lock
    
  end

  def is_mine? house

    if house.owner == @name
      return true
    else
      return false
    end
    
  end

end