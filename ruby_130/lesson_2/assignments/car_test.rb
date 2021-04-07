require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'car'

require "minitest/reporters"
Minitest::Reporters.use!


class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new(115)
    assert(car.wheels, 'Does not Exist')
    assert_equal(4, car.wheels)
  end

  def test_max_speed
    car = Car.new(200)
    assert_equal(200, car.max_speed)
  end

  def test_nil
    car = Car.new(120)
    refute_nil(car.wheels)
  end
end
