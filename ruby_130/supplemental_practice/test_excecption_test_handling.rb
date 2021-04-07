require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

module LevelErrors
  class MaxLevelReached < StandardError; end
  class NegativeLevel < StandardError; end
  LIST = [MaxLevelReached, NegativeLevel]
end

class Hero
  include LevelErrors
  def initialize
    @level = 1
  end

  def level_up(level)
    raise(LevelErrors::NegativeLevel) if level < 1
    (@level + level <= 100) ? (@level += level) : raise(LevelErrors::MaxLevelReached)
  end
end

class TestRaise < MiniTest::Test
  def test_exception_handle
    hero = Hero.new
    assert_raises(*LevelErrors::LIST) {hero.level_up(100)}
  end
end

#In this example we have taken the exception handling up a notch.
  # We have created a Module to contain all of our potential errors
  # that may be related to leveling up our character

#We have also employed these exception handlers in Hero#level_up

#And finally we supply a deconstrcuted array containing all possible level
#errors to our #assert_raises test statement on line 27 via the (*)
#splat operator
  # The Ruby doc shows that #assert_raises can take a dynamically sized number
  # of arguments
    # assert_raises(*exp) {|| ...}