require 'test_helper'

class ColumnizerTest < MiniTest::Unit::TestCase

  def test_returns_empty_array
    assert_equal [[],[],[]], InColumns::Columnizer.new([]).columns(3)
  end

  def test_does_not_modify_input
    input = ['a', 'b', 'c']
    InColumns::Columnizer.new(input).columns(2)
    assert_equal ['a', 'b', 'c'], input
  end

  def test_distribute_exact_elements
    input = ['a', 'b']
    output = InColumns::Columnizer.new(input).columns(2)
    assert_equal [['a'], ['b']], output
  end

  def test_distribute_too_many_elements
    input = ['a', 'b', 'c', 'd', 'e']
    output = InColumns::Columnizer.new(input).columns(2)
    assert_equal [['a', 'c', 'e'], ['b', 'd']], output

    output = InColumns::Columnizer.new(input).columns(3)
    assert_equal [['a', 'd'], ['b', 'e'], ['c']], output
  end

  def test_distribute_too_few_elements
    input = ['a', 'b']
    output = InColumns::Columnizer.new(input).columns(3)
    assert_equal [['a'], ['b'], []], output
  end

end
