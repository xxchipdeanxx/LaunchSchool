#Modify the House class so that the above program will work. 
#You are permitted to define only one new method in House.

class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end


  # def <=>(other)
  #   price <=> other.price
  # end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1.price < home2.price
puts "Home 2 is more expensive" if home2.price > home1.price

#Expected output
# Home 1 is cheaper
# Home 2 is more expensive