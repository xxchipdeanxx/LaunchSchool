class Car
  attr_accessor :wheels, :name
  attr_reader :max_speed

  def initialize(max_speed)
    @wheels = 4
    @max_speed = max_speed
  end


end