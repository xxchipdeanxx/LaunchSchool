module Walkable
  def walk
    puts "Let's take #{name} for a walk"
  end
end

class Cat
  attr_accessor :name
  include Walkable
  def initialize(name)
    @name = name
  end
end

baby = Cat.new('baby')
baby.walk