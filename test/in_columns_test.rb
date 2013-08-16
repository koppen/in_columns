require 'test_helper'

class InColumnsTest < MiniTest::Unit::TestCase
  def test_distributes_arrays_into_columns
    assert_equal [
      ['a', 'c', 'e'],
      ['b', 'd', nil]
    ], InColumns.columnize(['a', 'b', 'c', 'd', 'e'], 3)
  end
end
