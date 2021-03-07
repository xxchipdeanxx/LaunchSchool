class  Cargo
  def initialize(weight_lbs)
    @weight = weight_lbs
  end

  def +(other_cargo)
    self.convert_to_kg + other_cargo.convert_to_kg
  end

  private

  def convert_to_kg
    @weight * 0.453592
  end
end

suitcase = Cargo.new(25)
golf_clubs = Cargo.new(15)

p total_weight_kg = suitcase + golf_clubs

#We will get an error if we keep our convert method as private.
#Ruby interprets other_cargo.convert_to_kg as an attempt to call
# the private method from 'outside' the instance of the class

  #other_cargo.convert_to_kg == golf_clubs.convert_to_kg ==> #private method error

#protected methods are handy when we have a class that will interact with
#other instances of the same class which may require a call to a method
#that we don't want PUBLIC, yet we also need to be able to access within 
#the instance method of a seperate instance of the class.