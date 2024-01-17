class Sheep
  attr_accessor :price, :sale

  def initialize(price)
    @price = price
    @sale = 300
  end

  def grazing
    puts "The sheep is grazing in the field."
  end

  def sound
    puts "Moo! The cow is mooing."
  end

  def self.sale
    @sale
  end
end
