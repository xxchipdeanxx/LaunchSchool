#Using the class definition from step #3, let's create a few more people 
#-- that is, Person objects

#If we're trying to determine whether the two objects contain the same name, 
#how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    @first_name = name
    @last_name = ''
  end

  def name
    @first_name + " " + @last_name
  end

  def name=(new_name)
    # checks for a full or partial name entry
    partial_name = new_name.split
    self.first_name = partial_name.first
    self.last_name = partial_name.size > 1 ? partial_name.last : ''
  end

  def same_name?(other_name)
    self.name == other_name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.same_name?(rob.name)