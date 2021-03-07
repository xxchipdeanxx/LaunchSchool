class BadGuy
  @@count = 0
  attr_reader :type
  def initialize
    @type = %w(zombie vampire orc).sample
    @@count += 1
  end

  def self.count
    @@count
  end
end

class Game
  def initialize
    @enemies = []
  end

  def enemies
    @enemies.each_with_index do |enemy, index|
      puts "#{index + 1}: #{enemy.type}"
    end
  end

  def play
    spawn_enemy until BadGuy.count >= 3
    ## rest of game logic
  end

  private

  def spawn_enemy
    @enemies << BadGuy.new
  end
end

game = Game.new
game.play
game.enemies

# Here we implement a CLASS method (BadBuy::count) that will access the value referenced by the
# CLASS variable @@count. @@count is incremented each time we instantiate an object
# of BadGuy class

#Since the number of enemies is something that is best shared amongst the entire class
# it makes is much easier to implement our game logic if we treat the number of
# active BadGuys as a class-wide bit of data

#To further demonstrate this point --  can you think of a clean, easy way to
# keep track of the total number of instances of BadGuy at the object scope?

#It's true -- our game logic could simply track the Game::@enemies.size to implement our #spawn method
# BUT the challenge is to see if:
  # 1) It's possible to do so from within an instance of BadGuy as opposed to the Class a whole
  # 2) Are there any advantages by doing so?