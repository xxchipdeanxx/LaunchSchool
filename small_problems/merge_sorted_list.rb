#Write a method that takes two sorted Arrays as arguments, and returns a new 
#Array that contains all elements from both arguments in sorted order.

#You may not provide any solution that requires you to sort the result array. 
#You must build the result array one element at a time in the proper order.

#Your solution should not mutate the input arrays.


#Rules
#input - two sorted arrays
#output - a single, NEW sorted array

#both input arrays are SORTED

#can NOT use any Ruby sorting methods --> build from scratch
#no part of the mehod can sort the result array --> must be loaded in proper order
#can NOT modify the origional input arrays

#Data - Array

#Algo
# dupliate the origional input arrays
# create a loop --> until final array size contains all elements
  #iterate through each element of the first array 
    #iterate through the second array
      # if the leading element is smaller
        # pop and append to new array
      #if it is larger
        # pop and append the second array element
  # if the final array already contains the element
    # next
  # if the first array is empty
    # append the final elements to the result array

require 'pry'    


# def merge(array1, array2)
#   local_arr1, local_arr2 = array1.dup, array2.dup
#   results = []
#   local_arr1.each do |num1|
#     local_arr2.each do |num2|
#       if num1 < num2
#         results << num1
#         break
#       else
#         results << local_arr2.delete(num2)
#       end
#     end
#   end
#   p results
# end    


def merge(array1, array2)
  results = []
  index = 0
  array1.each do |number1|
    while index < array2.size && array2[index] < number1
      results << array2[index]
      index += 1
    end
    results << number1
  end
  results
end

# binding.pry
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]