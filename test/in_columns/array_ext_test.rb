require 'test_helper'

class ArrayExtensionTest < MiniTest::Unit::TestCase
  def setup
    Array.send(:include, InColumns::ArrayExt)
  end

  def test_distributes_array_into_columns
    assert_equal [
      ['a', 'c', 'e'],
      ['b', 'd', nil]
    ], ['a', 'b', 'c', 'd', 'e'].in_columns(3)
  end

  def test_works_for_empty_array
    assert_equal [], [].in_columns(3)
  end
end
