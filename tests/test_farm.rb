require 'minitest/autorun'
require './farm'

class TestFarm < Minitest::Test
  def test_grow_crops
    my_farm=Farm.new
    crops=my_farm.grow_crops
    assert(crops, 'Value should not be nil')
    refute(crops.negative?, 'Value should not be negative')
  end

end
