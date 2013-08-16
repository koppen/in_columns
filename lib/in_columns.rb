require "in_columns/version"

require "in_columns/array_ext"
require "in_columns/columnizer"

module InColumns
  def self.columnize(elements, number_of_columns)
    Columnizer.new(elements).distribute(number_of_columns)
  end
end
