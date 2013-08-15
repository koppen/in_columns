require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

require 'in_columns'

if ENV['TRAVIS'] == "true"
  require 'coveralls'
  Coveralls.wear!
end
