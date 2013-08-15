module InColumns
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
      (1..number_of_columns).collect { [] }
    end

    def distribute_elements(columns)
      elements.each_with_index { |element, index|
        column_number = index % columns.size
        columns[column_number] << element
      }
      columns
    end
  end
end
