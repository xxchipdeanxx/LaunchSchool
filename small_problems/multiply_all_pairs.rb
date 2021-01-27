#Write a method that takes two Array arguments in which each Array contains 
#a list of numbers, and returns a new Array that contains the product of every 
#pair of numbers that can be formed between the elements of the two Arrays. 
#The results should be sorted by increasing value.

#You may assume that neither argument is an empty Array.

#Problem
#multiply all nums in the first array by all nums in the second array

#Rules
#input - two arrays
#output - NEW single array --> sorted

#assume neither array will be empty

#total elements will be the number of elements in the first array mult.
#by the number of element in the second array

#NEW array must be sorted in ascending order

#Data - Array

#Algo
#access the first element of array 1
# mult by all elements of the second array
# repeat steps 1-2 until the first array is exhaused
# sort the array into ascending order and return 

# def multiply_all_pairs(arr1, arr2)
#   final_arr = []
#   (0...arr1.size).each do |index_1|
#     (0...arr2.size).each do |index_2|
#       final_arr << arr1[index_1] * arr2[index_2]
#     end  
#   end
#   final_arr.sort
# end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map {|array| array.reduce(&:*)}.sort
end



p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
