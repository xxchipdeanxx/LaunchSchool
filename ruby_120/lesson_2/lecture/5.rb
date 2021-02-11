#Let's add a to_s method to the class:

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

  def to_s
    self.name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
