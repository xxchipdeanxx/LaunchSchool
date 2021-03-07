class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2

#This is an example of lexical scope. Basically -- constants take on the context
# from where they are called

#Because our #wheels method was defined in the Car class
  # when we call bullet.wheels
  # we are technically invoking Car#wheels --> since #wheels is not defined in Motorcycle
  #Thus when Car#wheels is called --> it SEES only the WHEELS constant that is defined in the
  # Car class. It has no context or idea that Motorcycle::WHEELS exists as the code is written

# This can be resolved by:
  #overriding #wheels within our Motorcycle class OR
  #including namespace resolution on line 5

    # def wheels
    #   self.class::WHEELS
    # end

# WHEEL_NUM = 6

module Vehicle
  def wheels
    puts "I am a #{self.class} and I have #{WHEEL_NUM} wheels"
  end
end

class Bike
  include Vehicle
  WHEEL_NUM = 2
end

class Trike
  include Vehicle
  WHEEL_NUM = 3
end

bike = Bike.new
trike = Trike.new

bike.wheels
trike.wheels

# This is another example of lexical scope rules for CONSTANTS. Because we
# call the #wheel method which is inherited via the module Vehicle
# We are technically invoking the method from WITHIN the module
# Ruby sees a call to a constant WHEEL_NUM and searches where the CONSTANT is
# being called from --> in our case the module

#Since we do not have a WHEEL_NUM constant defined in the module --> Ruby will throw
# an error 'uninitialized constant Vehicle::WHEEL_NUM'

#Due to the lexical scoping rules of CONSTANTS --> The Ruy interpreter can not 'see'
# the constants we have defined within the classes themselves

#In order for our code to run -- we must include some namespace resolution
# on line 38
  # puts "I am a #{self.class} and I have #{self.class::WHEEL_NUM} wheels"

  #In short
  #lexical scoping means that a call to a CONSTANT takes on a context
  # based on WHERE the CONSTANT is being called/referenced

  #The best way to navigate this is to always be explicit
    #provide namespacing to clarify for the Ruby interpreter and other users
    # as to WHERE the constant should be referenced from

# We must also remember that CONSTANTS that are defined in the MAIN body of our
# program behave like global constants --> this is not a good practice and SHOULD
# be avoided as they will shadow all other

  #uncomment line 36 to see how it will affect our origional code