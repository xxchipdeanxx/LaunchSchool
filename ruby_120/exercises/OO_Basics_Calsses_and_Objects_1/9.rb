#Using the code from the previous exercise, replace the getter 
#and setter methods using Ruby shorthand.

class Cat
  attr_accessor :name
  def initialize(name)
    self.name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

kitty = Cat.new("Boots")
kitty.greet
kitty.name = 'Luna'
kitty.greet