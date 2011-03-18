$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'key'

class KeyTest < Test::Unit::TestCase
  def test_initial
    key = Key.new 5
    assert_equal key.valid?(key), true
  end
end
