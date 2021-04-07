require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new(10)
    car.wheels.must_equal 4           # this is the expectation
  end
end

describe 'Car#max_speed' do
  it 'zoom' do
    car = Car.new(100)
    car.max_speed.must_be :>, 50
  end
end