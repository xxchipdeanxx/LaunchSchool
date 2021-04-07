#Write a method that takes an array as an argument, and a block that returns 
#true or false depending on the value of the array element passed to it. 
#The method should return a count of the number of times the block returns true.

#You may not use Array#count or Enumerable#count in your solution.

# def count(collection)
#   true_count = 0
#   collection.each do |element|
#     true_count += 1 if yield(element)
#   end
#   true_count
# end

##Further Exploration##
#Write a version of the count method that meets the conditions of this 
#exercise, but also does not use each, loop, while, or until.

def count(collection)
  true_count = 0
  1.upto(collection.size) do |num|
    index = num - 1
    true_count += 1 if yield(collection[index])
  end
  true_count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2