#sing the code from the previous exercise, add a getter method named 
#name and invoke it in place of @name in #greet.


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