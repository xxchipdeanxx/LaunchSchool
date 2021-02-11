#The following code is flawed. It currently allows @name to be modified from 
#outside the method via a destructive method call. Fix the code so that it 
#returns a copy of @name instead of a reference to it.

class Person
 def name
  ret_val = @name.clone
  p @name.object_id
  p ret_val.object_id
  ret_val
 end

  def initialize(name)
    @name = name
  end

end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name