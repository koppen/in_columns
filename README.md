# InColumns

InColumns distributes the elements of an array into a number of equal-height columns.

    list = ['a', 'b', 'c', 'd', 'e']
    InColumns.columnize(list, 2)
    #=> [['a', 'c', 'e'], ['b', 'd']]
    
    InColumns.columnize(list, 3)
    #=> [['a', 'd'], ['b', 'e'], ['c']]

This is useful when you want to format a straight array into a number of
columns - say for displaying it to an end user.

## Extension to Array

If you feel so inclined, InColumns comes with a module that can be included
wherever you need columnizability (yes, that's totally a word):

    class Array
      include InColumns::ArrayExt
    end
    
    ['a', 'b', 'c'].in_columns(2)
    #=> [['a', 'c'], ['b']]

## Installation

Add this line to your application's Gemfile:

    gem 'in_columns'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install in_columns

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
