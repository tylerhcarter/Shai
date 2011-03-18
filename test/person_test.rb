$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'person'
require 'key'
require 'house'

class PersonTest < Test::Unit::TestCase
  def test_inital
    key = Key.new rand 100
    house = MockHouse.new 'TestPerson'
    person = People::Person.new 'TestPerson', house, key

    # Name gets set
    assert_equal person.name, 'TestPerson'

    # Money storage is initalized
    assert_equal person.money.respond_to?(:add), true

    # Money storage starts with correct amount
    assert_equal person.money.total, PERSON_START_MONEY
  end

  def test_house_act
    key = Key.new rand 100
    house = MockHouse.new 'TestPerson'
    person = People::Person.new 'TestPerson', house, key

    test_house = MockHouse.new 'TestPerson2'

    person.act test_house

    # Make sure the house was not acted upon
    assert_equal test_house.touched, false

    # Change the owner and try again
    test_house.owner = 'TestPerson'
    person.act test_house

    # This time the person should act on his house
    assert_equal test_house.touched, true
  end

  def test_bank_act
    key = Key.new rand 100
    house = MockHouse.new 'TestPerson'
    person = People::Person.new 'TestPerson', house, key

    test_bank = MockBank.new

    person.act test_bank

    # Make sure the person took action on the bank
    assert_equal test_bank.touched, true

    # Check that the deposit was under the correct name
    assert_equal test_bank.account, person.name

    # Check how much money the person has lost
    deposited_money = 100 - person.money.total
    assert_equal test_bank.amount, deposited_money

  end

  class MockBuilding
    include Enterable
  end

  class MockHouse < MockBuilding
    
    attr_accessor :locked, :touched, :owner

    @locked = true
    @touched = false
    @owner = ""

    def initialize owner
      @locked = true
      @touched = false
      @owner = owner
    end

    # Respond to unlock and lock
    def lock
      @locked = true
      @touched = true
      return true
    end

    def unlock key
      @locked = false
      @touched = true
      return true
    end

    # Respond to deposit money
    def deposit_money amount
      @touched = true
    end
  end

  class MockBank < MockBuilding

    attr_accessor :touched, :amount, :account
    @touched = false
    @amount = 0
    @account = ""

    def deposit amount, account
      @touched = true
      @amount = amount
      @account = account
    end

  end
end
