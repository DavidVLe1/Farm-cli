class Cow
  attr_accessor :price, :sale

  def initialize(price)
    @price = price
    @sale = 800
  end

  def grazing
    puts "The cow is grazing in the field."
  end

  def sound
    puts "Moo! The cow is mooing."
  end
end
