# Write a method called map that behaves similarly for Arrays. 
#It should take an Array as an argument, and a block. 
#It should return a new Array that contains the return values produced by 
#the block for each element of the original Array.

require 'set'

def map(array)
  array.each_with_object([]) do |element, result_ary|
    result_ary << yield(element)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

hsh = {:age => 30, :name => 'Donny', :fave_food => 'Pizza'}
p map(hsh) {|key, value| value == 'Pizza'}

p map(Set[1,2,3,4]) {|num| num + 1}