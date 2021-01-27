#Write a method that takes an Array as an argument, and returns two Arrays 
#(as a pair of nested Arrays) that contain the first half and second half of 
#the original Array, respectively. If the original array contains an odd number 
#of elements, the middle element should be placed in the first half Array.

#Problem
# given one array. split the array in half and return two arrays nested
# in another array. If the size of the array is odd. The middle element 
# should be placed in our first nested array

#Rules
#input - array
#output - nested array --> [[first half], [second half]]

#If array has odd num of elements. The remaining element
# is placed in the first array

#order is kept
#a single element will return one empty array
#an empty array returns two empty arrays

#Data - Array

#Algo
# array.size is even
  #take first half and store in array
  # append the remaining elements in an array
# if size is odd
  #take first half (plus one element) --> store in an array
  # append the remaining elements in the array
#return the final array

require 'pry'

# def halvsies(array)
#   stop_index = array.size.even? ? (array.size) / 2 : ((array.size) / 2) + 1

#   first =  array[0...stop_index]
#   second = array[stop_index..-1]

#   [first,second]
# end


# def halvsies(array)
#   final_array = []
#   stop_index = array.size.even? ? (array.size) / 2 : ((array.size) / 2) + 1
#   final_array << array.shift(stop_index)
#   final_array << array

#   final_array
# end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  fist_half = array.slice(0,middle)
  second_half = array.slice(middle, array.size - middle)
  [fist_half,second_half]
end






p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]