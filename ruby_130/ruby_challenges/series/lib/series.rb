require 'time'

class Series
  def initialize(string)
    @chars = string.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError unless num <= @chars.size
    @chars.each_cons(num).to_a
  end
end

class SeriesV2
  def initialize(string)
    @chars = string
  end

  def slices(num)
    raise ArgumentError unless num <= @chars.size
    @chars.chars.map(&:to_i).each_cons(num).to_a
  end
end

result1 = nil
result2 = nil

obj1 = Series.new('31001')
obj2 = SeriesV2.new('31001')

loop do
  start1 = Time.now
  obj1.slices(3)
  result1 = (Time.now - start1)

  start2 = Time.now
  obj2.slices(3)
  result2 = (Time.now - start2)
  break
end

puts "Version 1: #{result1}"
puts "Version 2: #{result2}"

#Version two is a little faster considering that we do not waste the method calls
  #chars.map(&:to_i).each_cons().to_a on a potentially invalid input
#we use the guard clause first, and only if the input is valid do we move forward with the rest
  #of the method executions