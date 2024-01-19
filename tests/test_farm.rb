require 'minitest/autorun'
require './farm'

class TestFarm < Minitest::Test
  def test_grow_crops
    puts "Testing growing crops."
    my_farm=Farm.new
    crops=my_farm.grow_crops
    assert(crops, 'Value should not be nil')
    refute(crops.negative?, 'Value should not be negative')

  end

  def test_sell_crops_and_profits
    puts "Testing selling crops."
    my_farm=Farm.new
    my_farm.grow_crops
    my_farm.sell_crops
    profit=my_farm.count_money
    refute(profit.negative?, 'Selling crops should not be nil nor negative')
    assert_equal 0, my_farm.count_total_crops, "There should be 0 crops left."
  end

  def test_raise_cow
    puts "Testing raising cow."
    my_farm=Farm.new
    my_farm.raise_cow
    my_farm.raise_cow
    assert_equal 2, my_farm.count_animals, "There should be 2 cows raised since we called it twice."
    
  end

  def test_raise_sheep_and_animal_counted
    puts "Testing raising sheep."
    my_farm=Farm.new
    my_farm.raise_sheep
    assert_equal 1, my_farm.count_animals, "There should be 1 sheep raised since we called it once."
  end

  def test_no_initial_animals
    puts "Testing for empty animal array."
    my_farm=Farm.new
    assert_equal 0, my_farm.count_animals, "There should initially be 0 animals."
  end

  def test_sell_animals
    puts "Testing selling animals."
    my_farm=Farm.new
    my_farm.raise_cow
    assert_equal 1, my_farm.count_animals, "there should be 1 animal at this point."
    my_farm.raise_sheep
    assert_equal 2, my_farm.count_animals, "there should be 2 animals at this point."
    assert(my_farm.count_money.negative?, "We only purchased animals thus money should be in the negative.")
    my_farm.sell_animals
    refute(my_farm.count_money.negative?, "Money should be positive at this point of selling animals.")
    assert_equal 0, my_farm.count_animals, "We should have 0 animals at this point."
  end

end
