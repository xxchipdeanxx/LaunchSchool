#Our level up logic isn't working as expected. What might the problem be?

class Hero
  attr_reader :name, :level, :current_exp
  def initialize(name)
    @name = name
    @current_exp = 0
    @level = 1
  end

  def add_exp(points)
    current_exp += points
  end

  def status_check
    level_up if current_exp >= 10_000
  end

  private

  attr_writer :name, :level, :current_exp

  def level_up
    level += 1
  end
end

lancelot = Hero.new('Lacelot')
p lancelot.level
lancelot.add_exp(10_000)
lancelot.status_check
p lancelot.level


#solution - we must add 'self' to our setter method calls in order to
# disambiguate the difference between the setter method calls and the
# creation of a local variable to the method. Which technically
# has not been instantiated before FIRST tring to add to it
  #You cant invoke + method on an object that has a (nil) identity