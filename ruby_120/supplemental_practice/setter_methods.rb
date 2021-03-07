require 'pry'

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def -(years)
    @age -= years
  end
end

person1 = Person.new('Chip',30)
puts person1.name
person1.name = 'Hank'
puts person1.name
binding.pry
person1 - 5
p person1.age
