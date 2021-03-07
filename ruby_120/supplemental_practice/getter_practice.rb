class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

frank = Person.new('frank')
puts frank.name

puts frank.name.upcase!

puts frank.name

#Since our generic GETTER method simply returns the object referenced by
# the instance variable @name we must be aware that, despite not having an
# explicit SETTER method, we are still able to modify the value referenced
# by @name

#The method String#upcase! modifies a string IN PLACE, meaning that it does not
# technically use the assignment method (=). 

#Thus when we chain frank.name.upcase!
  #we are fist calling our GETTER method which will return the string referenced
  # at @name
  #From there #upcase! destructivly modifies the string in place
    #this change will last for the duration of the instances lifespan

#Thus -  in order to prevent any potential data manipulation
# we can create a custom GETTER method that will return a shallow copy of the 
# information referenced by an instance variable
  # We can eiter use #dup or #clone
    #remember that #dup will not respect frozen objects and will allow modification
    #clone will respect frozen object and throw FrozenError if a modification is attempted
  #The application of either method depends on the nature of the program/data being used