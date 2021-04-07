#Write a method that takes a sorted array of integers as an argument, and 
#returns an array that includes all of the missing integers (in order) 
#between the first and last elements of the argument.

#Origional solution
# def missing(array)
#   result = []
#   (array.min..array.max).each do |num|
#     result << num unless array.include?(num)
#   end
#   result
# end

#No methods that use blocks
def missing(array)
  result = (array.min..array.max).to_a
  result -= array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []