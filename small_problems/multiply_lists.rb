#Write a method that takes two Array arguments in which each Array contains a 
#list of numbers, and returns a new Array that contains the product of each 
#pair of numbers from the arguments that have the same index. 
#You may assume that the arguments contain the same number of elements.

#Problem
#given two arrays. multiply each element at each index with the complimenting
#element in the other array. Return the results to a NEW array and return

#Rules
#input - two arrays
#output - single array

#arrays will always be the same size
# NEW array is returned

#Data - Array

#Algo
#iterate through each array or generate each index
#multiply each element and push into a new array
#return the new array

# def multiply_list(arr1, arr2)
#   final_arr = []
#   (0...arr1.size).each do |index|
#     final_arr << (arr1[index] * arr2[index])
#   end
#   final_arr
# end

# def multiply_list(arr1, arr2)
#   final_arr = []
#   arr1.each_with_index do |num, index|
#     final_arr << num * arr2[index]
#   end
#   final_arr
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|arr| arr[0] * arr[1]}
end




p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]