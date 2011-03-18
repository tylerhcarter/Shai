$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'money_storage'

class MoneyStorageTest < Test::Unit::TestCase
  def test_initial
    storage = MoneyStorage.new "TestOwner", 100

    assert_equal storage.owner, "TestOwner"
    assert_equal storage.total, 100
  end

  def test_deposit
    storage = MoneyStorage.new "TestOwner", 100
    storage.add 100

    assert_equal storage.total, 200
  end

  def test_withdraw
    storage = MoneyStorage.new "TestOwner", 100
    storage.subtract 50

    assert_equal storage.total, 50
  end

  def test_return
    storage = MoneyStorage.new "TestOwner", 100
    deposit_result = storage.add 100
    withdraw_result = storage.subtract 50

    assert_equal deposit_result.amount, 100
    assert_equal deposit_result.type, "deposit"

    assert_equal withdraw_result.amount, 50
    assert_equal withdraw_result.type, "withdraw"
  end
end
