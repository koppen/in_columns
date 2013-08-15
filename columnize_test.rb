require 'minitest/autorun'
require 'minitest/pride'

class Columnizer
  def initialize(elements)
    @elements = elements
  end

  def columns(number_of_columns)
    columns = create_columns(number_of_columns)
    distribute_elements(columns)
  end

  private

  attr_reader :elements

  def create_columns(number_of_columns)
    columns = []
    number_of_columns.times {
      columns << []
    }
    columns
  end

  def distribute_elements(columns)
    elements.each_with_index { |element, index|
      column_number = index % columns.size
      columns[column_number] << element
    }
    columns
  end
end

class ColumnizerTest < MiniTest::Unit::TestCase

  def test_returns_empty_array
    assert_equal [[],[],[]], Columnizer.new([]).columns(3)
  end

  def test_does_not_modify_input
    input = ['a', 'b', 'c']
    Columnizer.new(input).columns(2)
    assert_equal ['a', 'b', 'c'], input
  end

  def test_distribute_exact_elements
    input = ['a', 'b']
    output = Columnizer.new(input).columns(2)
    assert_equal [['a'], ['b']], output
  end

  def test_distribute_too_many_elements
    input = ['a', 'b', 'c', 'd', 'e']
    output = Columnizer.new(input).columns(2)
    assert_equal [['a', 'c', 'e'], ['b', 'd']], output

    output = Columnizer.new(input).columns(3)
    assert_equal [['a', 'd'], ['b', 'e'], ['c']], output
  end

  def test_distribute_too_few_elements
    input = ['a', 'b']
    output = Columnizer.new(input).columns(3)
    assert_equal [['a'], ['b'], []], output
  end

end
