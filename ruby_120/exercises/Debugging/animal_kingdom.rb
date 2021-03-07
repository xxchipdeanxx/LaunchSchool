#The code below raises an exception. 
#Examine the error message and alter the code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet,superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

#The issue here is that the constructor for SongBird takes (3) arguments
# in order to implement properly. The trouble is that we also want to call
# the constructor for Animal class via super.

#Since super was used (withouth any explicit values being passed), the Ruby
# interpreter assumes that we would like to pass all (3) arguments to 
# Animal#initialize, but this will result in an ArgumentError since 
# Animal#initialize is expexting only (2) argumets, but it is passed all (3)
# when super is called in SongBird#initialize

#To remedy the issue, we must be more explicit about which arguments we
# want to send to our superclass constructor
  # super(diet, superpower)

## Further Exploration##
# Is a constructor necessary for FlightlessBird class?
# No - in absense of a constructor method -- Ruby will seach up the 
# ancestor chain to find one.

# Since FlightlessBird#initialize simply calls super which is cast all the way up to
#Animal#initialize --> there really is no need to have a constructor in the FlightlessBird class