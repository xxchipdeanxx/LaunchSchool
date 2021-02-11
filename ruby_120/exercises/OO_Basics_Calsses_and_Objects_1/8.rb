#Using the code from the previous exercise, add a setter method named #name. 
#Then, rename kitty to 'Luna' and invoke #greet again.

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