$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'Buildings/house'
require 'person'
require 'key'

class HouseTest < Test::Unit::TestCase

  def test_initial
    house = Building::House.new 'TestOwner'

    assert_equal house.owner, 'TestOwner'
    assert_equal house.money.total, 0
  end

  def test_enter
    house = Building::House.new 'TestOwner'
    person = MockPerson.new
    person_two = MockPerson.new

    # Start out with empty house
    assert_equal house.get_occupants.size, 0

    # Person entering should increase occupant count
    house.enter person
    house.enter person_two
    assert_equal house.get_occupants.size, 2

    # Person leaving should decrease occupant count
    house.exit person
    assert_equal house.get_occupants.size, 1
  end

  def test_lock
    house = Building::House.new 'TestOwner'
    key = Key.new 0

    # House starts unlocked
    puts house.isLocked?.to_s
    assert_equal(house.isLocked?(), false, "House started locked")

    # House should be able to be locked
    house.lock
    assert_equal house.isLocked?, true

    # Setting a key should return true
    assert_equal house.setKey(key), true, "Unable to set key"

    # Trying to set it again should return false
    assert_equal house.setKey(key), false, "Able to set key twice"

    # You should now be able to unlock the house
    house.unlock(key)
    assert_equal(house.isLocked?(), false, "Failed to unlock house")

    
  end

  class MockPerson
  end

end
