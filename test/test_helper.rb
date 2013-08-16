require 'rubygems'
require 'bundler/setup'

if ENV['TRAVIS'] == "true"
  require 'coveralls'
  Coveralls.wear!
end

require 'minitest/autorun'
require 'minitest/pride'

require 'in_columns'
