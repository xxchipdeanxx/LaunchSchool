#Using the code from the previous exercise, move the greeting from the 
#initialize method to an instance method named #greet that prints a greeting 
#when invoked.

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