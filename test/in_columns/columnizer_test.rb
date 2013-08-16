require 'test_helper'

class ColumnizerTest < MiniTest::Unit::TestCase

  def test_distribute_1_into_3
    input = ['a']
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a']
    ], output
  end

  def test_distribute_2_into_3
    input = ['a', 'b']
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'b']
    ], output
  end

  def test_distribute_4_into_3
    input = ['a', 'b', 'c', 'd']
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'c', 'd'],
      ['b', nil, nil]
    ], output
  end

  def test_distribute_5_into_3
    input = ['a', 'b', 'c', 'd', 'e']
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'c', 'e'],
      ['b', 'd', nil]
    ], output
  end

  def test_distribute_6_into_3
    input = ['a', 'b', 'c', 'd', 'e', 'f']
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'c', 'e'],
      ['b', 'd', 'f']
    ], output
  end

  def test_distribute_10_into_3
    input = ('a'..'j').to_a
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'e', 'h'],
      ['b', 'f', 'i'],
      ['c', 'g', 'j'],
      ['d', nil, nil]
    ], output
  end

  def test_distribute_nil_values
    input = ['a', nil]
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', nil]
    ], output
  end

  def test_does_not_modify_input
    input = ['a', 'b', 'c']
    InColumns::Columnizer.new(input).distribute(2)
    assert_equal ['a', 'b', 'c'], input
  end

  def test_returns_empty_array
    assert_equal [], InColumns::Columnizer.new([]).distribute(3)
  end

  def test_distribute_exact_elements
    input = ['a', 'b']
    output = InColumns::Columnizer.new(input).distribute(2)
    assert_equal [
      ['a', 'b']
    ], output
  end

  def test_distribute_into_one_column
    input = ['a', 'b']
    output = InColumns::Columnizer.new(input).distribute(1)
    assert_equal [
      ['a'],
      ['b']
    ], output
  end

  def test_distribute_too_many_elements
    input = ['a', 'b', 'c', 'd', 'e']
    output = InColumns::Columnizer.new(input).distribute(2)
    assert_equal [
      ['a', 'd'],
      ['b', 'e'],
      ['c', nil]
    ], output
  end

  def test_columns_should_be_of_equalish_height
    input = ('a'..'j').to_a
    output = InColumns::Columnizer.new(input).distribute(3)
    assert_equal [
      ['a', 'e', 'h'],
      ['b', 'f', 'i'],
      ['c', 'g', 'j'],
      ['d', nil, nil]
    ], output
  end

  def test_can_be_run_multiple_times
    input = ['a', 'b']
    columnizer = InColumns::Columnizer.new(input)
    assert_equal columnizer.distribute(3), columnizer.distribute(3)
  end
end
