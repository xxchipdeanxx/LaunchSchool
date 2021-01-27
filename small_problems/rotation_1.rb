#Write a method that rotates an array by moving the first element to the end 
#of the array. The original array should not be modified.

#Do not use #rotate or #rotate!

#Problem
#Write a method that takes the first element of an array
# and moves it to the end of the array.
# The origional array should not be modified

#Rules
#Input - an array
#Output - a NEW modified array

#Do not use either #rotate or #rotate!
#An array with one element returns itself
#Do NOT modify the origional array

#Data - Array

#Algo
# duplicate the input array to a new array
# remove the first element and store in a temp variable
# append the removed variable to the end of the array
# return the new array


def rotate_array(input_array)
  local_array = input_array.dup
  local_array << local_array.shift
end

def rotate_string(string)
  char_array = string.chars
  rotate_array(char_array).join
end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p rotate_string('test') == 'estt'
