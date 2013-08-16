# InColumns

InColumns distributes the elements of an array into a number of equal-height columns.

This is useful when you want to format a straight array into a number of
columns - say for displaying it to an end user.

[![Build Status](https://travis-ci.org/koppen/in_columns.png?branch=master)](https://travis-ci.org/koppen/in_columns) [![Coverage Status](https://coveralls.io/repos/koppen/in_columns/badge.png)](https://coveralls.io/r/koppen/in_columns) [![Code Climate](https://codeclimate.com/github/koppen/in_columns.png)](https://codeclimate.com/github/koppen/in_columns)

## Usage example

    list = ['a', 'b', 'c', 'd', 'e']
    InColumns.columnize(list, 3)
    #=> [['a', 'c', 'e'], ['b', 'd', nil]]
    
    InColumns.columnize(list, 2)
    #=> [['a', 'd'], ['b', 'e'], ['c', nil]]

## Extension to Array

If you feel so inclined, InColumns comes with a module that can be included
wherever you need columnizability (yes, that's totally a word):

    class Array
      include InColumns::ArrayExt
    end
    
    ['a', 'b', 'c'].in_columns(2)
    #=> [['a', 'c'], ['b', nil]]

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
