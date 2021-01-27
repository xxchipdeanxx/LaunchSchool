#Write a method that takes two Arrays as arguments, 
#and returns an Array that contains all of the values from the argument Arrays. 
#There should be no duplication of values in the returned Array, 
#even if there are duplicates in the original Arrays.

#Problem
# given two arrays. Combine all elements, but eliminate any duplicate
# elements. The final array should only contain one instance of each 
# element in the two input arrays

#Rules
#input - two arrays
#output - one array --> no duplicate elements

#all values should be represented only once

#Data - Array

#Algo
# create a final array = []
# assign to first array
# iterate through second array
  # if element exisits in final array --> do nothing
  # else append elemtn into final array

# def merge(arr1,arr2)
#   final_arr = arr1
#   arr2.each do |element|
#     final_arr << element unless final_arr.include?(element)
#   end
#   final_arr
# end

# def merge(arr1,arr2) --> using Array#unique
#   (arr1 + arr2).uniq
# end

def merge(arr1, arr2)  # --> using Array#union, preserves order
  arr1 | arr2
end





p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]