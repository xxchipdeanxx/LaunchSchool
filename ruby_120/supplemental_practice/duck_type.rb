class Player
  attr_reader :att, :def, :dex, :name
  def initialize(name,attk, deff, dex)
    @name = name
    @att = attk
    @def = deff
    @dex = dex
    @gear = []
  end

  def <<(item)
    @gear << item
  end

  def lvl_up
    @gear.each do |item|
      item.calc_bonus(self)
    end
  end

  def show_inventory
    @gear.each do |item|
      puts "#{item.class}: #{item.stat}"
    end
  end
end

class Shield
  attr_reader :stat

  BASE = 5
  def initialize
    @stat = BASE
  end

  def calc_bonus(player)
    armour_bonus(player.def)
  end

  private
  def armour_bonus(defense)
    @stat = BASE + defense
  end
end

class Sword
  attr_reader :stat

  BASE = 10
  def initialize
    @stat = BASE
  end

  def calc_bonus(player)
    armour_bonus(player.att)
  end

  private
  def armour_bonus(attack)
    @stat = BASE + attack
  end
end

class Dagger
  attr_reader :stat

  BASE = 3
  def initialize
    @stat = BASE
  end

  def calc_bonus(player)
    armour_bonus(player.dex)
  end

  private
  def armour_bonus(dexterity)
    @stat = BASE + dexterity
  end
end

hanz = Player.new('Hanz', 10, 8, 3)

hanz << Sword.new << Shield.new << Dagger.new #load inventory

hanz.show_inventory

hanz.lvl_up
puts ''
hanz.show_inventory

#Unrelated classes able to be easily upgraded through a common interface
#that will behave differently based the the applicable Player stat

#calc_bonus acts as a common interface for all of the items
#stat behaves in much the same way

#in this case class in not taken into consideration. All Ruby cares about is
#that each item has a #calc_bonus method defined

#Another way to introduce polymorphism to our program via Duck-typing