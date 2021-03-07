#The battle is not ending despite our player's health dropping below 0.
#What is going on?

require 'pry'

class Hero
  attr_reader :name, :health

  def initialize
    @name = select_name
    @health = 10
  end

  def health=(damage)
    @health -= damage
    return @health
  end


  private
  def select_name
    puts "Please enter your name:"
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Please enter something in the field"
    end
    name
  end
end

class Game
  DAMAGE = (5..8)
  def initialize
    @player = Hero.new
  end

  def battle
    damage = rand(DAMAGE)
    if (player.health=(damage)) > 0
      puts 'The fight rages on'
    else
      puts 'You have been slain'
    end
  end

  def show_health
    puts "#{player.health}"
  end

  private
  attr_reader :player
end

game = Game.new
game.battle
game.show_health
game.battle
game.show_health
game.battle
game.show_health
game.battle
game.show_health

#Because setter methods always return the arguments they were passed
# we will never get a FALSE evaluation

#The way we wrote our conditional hinges on the return of our setter method
# eventually evaluating as false
  # while the method DOES adjust the @health of the player --> the
  # setter method will alway return a value from (1..5) which can never
  # be less than 0
  #even an explicit return statement on line 13 will not change this behavior

#Thus our player health can go below 0 and the battle can still 'rage on'

#This is an extreme example and most people would choose to override the
# - (minus) 'fake' operator in order to handle the gameplay logic

#This example is a cautionary tale against using the return of a setter method
# as a part of a conditional statement

#Because setter methods always return their origional arguments --> they will almost
#always be considered 'truthy' and will seldom evaluate as false

#Another example can be seen at:
 # https://launchschool.com/exercises/05ac9b2b