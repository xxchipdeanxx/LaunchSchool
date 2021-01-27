#Write a method that combines two Arrays passed in as arguments, 
#and returns a new Array that contains all elements from both Array arguments, 
#with the elements taken in alternation.

#You may assume that both input Arrays are non-empty, and that they have the 
#same number of elements.

#Problem
#combine each array in alternating fashion

#Rules
#input - two arrays
#output - single array --> alternating

#arrays are never empty and always the same size

#first input array goes first for loading

#Data - Array

require 'pry'

#Algo
#iterate through a range to represent index
# add each array element to a final array

# def interleave(arr1,arr2)
#   final_array = []
#   (0...arr1.size).each do |index|
#     final_array << arr1[index] << arr2[index]
#   end
#   final_array
# end

# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end

def interleave(arr1,arr2)
  arr1.zip(arr2).flatten
end




# binding.pry
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']