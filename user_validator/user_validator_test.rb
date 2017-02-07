## user validator development testing
require 'minitest/autorun'
require 'minitest/pride'
require './user_validator.rb'

# require 'csv'
# CSV.read('homework.csv')

class ValidateTest < Minitest::Test
  def test_initialize
    assert Validate.new('homework.csv')
  end
end
