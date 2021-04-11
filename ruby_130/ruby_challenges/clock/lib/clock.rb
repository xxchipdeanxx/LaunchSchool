class Clock
  attr_reader :hour, :min

  def initialize(hour,min = 0)
    @hour = hour
    @min = min
    adjust_clock
  end

  def self.at(hour,min = 0)
    Clock.new(hour,min)
  end

  def to_s
    format('%02d:%02d', hour, min)
  end

  def +(mins)
    @min += mins
    adjust_clock
    self
  end

  def -(mins)
    @min -= mins
    adjust_clock
    self
  end

  def ==(other_clock)
    hour == other_clock.hour && min == other_clock.min
  end

  private

  def adjust_clock
    additional_hours, remaining_mins = @min.divmod(60)
    @hour += additional_hours
    @min = remaining_mins
    @hour = @hour.divmod(24).last
  end
end


