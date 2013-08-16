module InColumns
  class Columnizer
    def initialize(elements)
      @elements = elements
    end

    # Returns the necessary rows to distribute elements into the desired number
    # of columns
    #
    # The result is a multidimensional array, so that:
    #
    #   Columnizer.new(['a', 'b', 'c']).distribute(2)
    #   #=> [['a', 'c'], ['b', nil]]
    def distribute(number_of_columns)
      return [] if elements.empty?
      distribute_elements(number_of_columns)
    end

    private

    attr_reader :elements

    def distribute_elements(number_of_columns)
      number_of_rows = (number_of_elements.to_f / number_of_columns).ceil
      counts = row_counts(number_of_columns)

      columns = []
      elements_to_distribute = elements.dup

      while !elements_to_distribute.empty?
        size_of_column = counts[columns.size]
        elements_for_column = elements_to_distribute.shift(size_of_column)
        columns << elements_for_column
      end

      # Convert the columns to rows
      first_column = columns.first
      rest_columns = columns[1..-1]
      columns = first_column.zip(*rest_columns)
    end

    def number_of_elements
      elements.size
    end

    # Returns an array with an element for each column containing the number of
    # rows for that column
    def row_counts(number_of_columns)
      per_column = (number_of_elements / number_of_columns).floor
      counts = [per_column] * number_of_columns

      left_overs = number_of_elements % number_of_columns
      left_overs.times { |n|
        counts[n] = counts[n] + 1
      }

      counts
    end
  end
end
