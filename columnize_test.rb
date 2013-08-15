require 'minitest/autorun'
require 'minitest/pride'

class Columnizer
  def initialize(elements, number_of_columns)
    @elements = elements
    @number_of_columns = number_of_columns
  end

  def columns
    columns = create_columns(number_of_columns)
    distribute_elements(elements, columns)
  end

  private

  attr_reader :elements, :number_of_columns

  def create_columns(number_of_columns)
    columns = []
    number_of_columns.times {
      columns << []
    }
    columns
  end

  def distribute_elements(elements, columns)
    elements.each_with_index { |element, index|
      column_number = index % number_of_columns
      columns[column_number] << element
    }
    columns
  end
end

class ColumnizerTest < MiniTest::Unit::TestCase

  def test_returns_empty_array
    assert_equal [[],[],[]], Columnizer.new([], 3).columns
  end

  def test_does_not_modify_input
    input = ['a', 'b', 'c']
    Columnizer.new(input, 2).columns
    assert_equal ['a', 'b', 'c'], input
  end

  def test_distribute_exact_elements
    input = ['a', 'b']
    output = Columnizer.new(input, 2).columns
    assert_equal [['a'], ['b']], output
  end

  def test_distribute_too_many_elements
    input = ['a', 'b', 'c', 'd', 'e']
    output = Columnizer.new(input, 2).columns
    assert_equal [['a', 'c', 'e'], ['b', 'd']], output
  end

  def test_distribute_too_few_elements
    input = ['a', 'b']
    output = Columnizer.new(input, 3).columns
    assert_equal [['a'], ['b'], []], output
  end

end
