class Person

  attr_accessor :name, :money

  @name = ""
  @key = ""
  @money
  @house

  def initialize name, house
    @name = name

    if !house.respond_to? :getKey
      raise "Person::Initalize must recieve a house as a #2 parameter"
    end

    @key = house.getKey
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
    house.deposit_money 100
    @money.subtract 100

    # Random chance he forgets to lock the house
    num = rand 100
    if num < 10
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