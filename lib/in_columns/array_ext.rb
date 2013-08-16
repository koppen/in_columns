require_relative './columnizer'

module InColumns
  module ArrayExt
    def in_columns(number_of_columns)
      InColumns::Columnizer.new(self).distribute(number_of_columns)
    end
  end
end
