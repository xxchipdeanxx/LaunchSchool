#Write a method that takes an Array as an argument, and reverses its elements 
#in place; that is, mutate the Array passed into this method. 
#The return value should be the same Array object.

#Note: for the test case list = ['abc'], we want to reverse the elements in 
#the array. The array only has one element, a String, but we're not reversing 
#the String itself, so the reverse! method call should return ['abc']

#Problem
#Reverse an array of objects without using #reverse or #reverse! Ruby methods
#should return the same Array container when done

#Rules
#input - Array
#output - SAME array only rearranged

#empty array should return an empty array
#if array only has one element --> array should remain unchanged

#arrangd based on index positon --> NOT like sort

#Data - Array

#Algo
#access each elemet of the array
# based on last --> index
# delete_at index and append
# return the array

# def reverse!(list)
#   final_index = -list.size
#   -2.downto(final_index) do |index|
#     list << list.delete_at(index)
#   end
#   list
# end

require 'pry'

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end


list = [1,2,3,4]
binding.pry
result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) #== ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
#  reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true