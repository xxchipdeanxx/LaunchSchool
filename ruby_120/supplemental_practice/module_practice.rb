module Baddie
  class Boss
  end

  class Grunt
    @@count = 0
    def initialize
      @health = 15
      @@count += 1
    end
  end

  class DungeonBoss < Boss
  end
end

module NPC
  class Grunt
    def initialize
      @health = 10
      @loot = []
    end
  end
end

class Game
  include Baddie
  include NPC
  attr_reader :common_enemies
  def initialize
    spawn_enemies(Grunt)
    @boss = Boss.new
  end

  private

  def spawn_enemies(type)
    @common_enemies = []
    3.times {@common_enemies << type.new}
  end
end

game = Game.new
p game.common_enemies.all? {|enemy| enemy.class == Baddie::Grunt}

# If we did not use scope resolution (::) our game would span NPC 'Grunts' instead
# of the expected enemies.

#This is because the last module added is the first place Ruby will search
#for a method if none is found in the class definition itself
  #Thus -- Ruby doesn't find a class definition for Grunt in the Game class
  #it begins its search in the NPC module where it finds a Grunt class definition
