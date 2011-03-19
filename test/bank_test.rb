$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'Buildings/bank'

class BankTest < Test::Unit::TestCase
  def test_initial
    bank = Building::Bank.new

    # Bank starts out with no money
    assert_equal bank.total, 0
  end

  def test_deposit
    bank = Building::Bank.new

    bank.deposit 100, 'TestAccount'

    assert_equal bank.total, 100
  end
end
