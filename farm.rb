require_relative "sheep"
require_relative "cow"

class Farm
  attr_accessor :money, :total_crops, :animals

  def initialize
    @money = 0
    @total_crops = 0
    @animals = []
  end

  def run
    loop do
      puts "Welcome to your Farm. Select the options of what you want to do at your farm.
        1. Grow crops
        2. Sell crops
        3. Count crops
        4. Count money
        5. Count animals
        6. Raise Cow
        7. Raise Sheep
        8. Sell animals
        9. Exit
        "

      choice = gets.chomp.to_i

      case choice
      when 1
        grow_crops
      when 2
        sell_crops
      when 3
        count_total_crops
      when 4
        count_money
      when 5
        count_animals
      when 6
        raise_cow
      when 7
        raise_sheep
      when 8
        sell_animals
      when 9
        exit_program
      else
        puts "Invalid choice. Please select a valid option."
      end
    end
  end
end

def grow_crops
  puts "growing crops..."
  num_crops = rand(0..30)
  puts "you have grown #{num_crops} crops."
  @total_crops += num_crops
end

def count_total_crops
  puts "You have a total of #{@total_crops} crops."
end

def sell_crops
  @money += @total_crops * 10
  puts "you sold #{@total_crops} crops."
  @total_crops = 0
end

def count_money
  puts "You have a total of $#{@money}."
  if @money > 0
    puts "You are doing great!"
  elsif @money == 0
    puts "You should start raising crops or animals"
  else
    puts "You are in the negative, start selling your crops and animals."
  end

  
end

def raise_cow
  cow_cost = 300
  @animals << Cow.new(cow_cost)
  @money -= cow_cost
  puts "You have spent #{cow_cost} to raise a Cow."
end

def raise_sheep
  sheep_cost = 100
  @animals << Sheep.new(sheep_cost)
  @money -= sheep_cost
  puts "You have spent #{sheep_cost} to raise a Sheep."
end

def count_animals
  sheep_count = 0
  cow_count = 0

  @animals.each do |animal|
    if animal.is_a?(Sheep)
      sheep_count += 1
    elsif animal.is_a?(Cow)
      cow_count += 1
    end
  end

  puts "You have #{sheep_count} sheep and #{cow_count} cows in the farm."
end

def sell_animals
  if animals.length==0
    puts "You have no animals to sell, raise some animals!"
  else
    @animals.each do |animal|
      if animal.is_a?(Sheep)
        @money += Sheep.sale
      elsif animal.is_a?(Cow)
        @money += Cow.sale
      end
    end
    @animals = []
  end

end

def exit_program
  puts "Exiting the program. Goodbye!"
  exit
end
