# In this kata you will create a function that takes a 
# list of non-negative integers and strings and returns 
# a new list with the strings filtered out.

# Problem
# Given an array of integers and strings, return an array
# containing ONLY the integer values

# Rules
# input will be an array containing both integers and strings
# string representations of integers --> '1' are NOT inluded
# must handle integers of any length
# only integer numbers must be included in the array

#Input - an array of strings and integer elements
#Output - an array containing only the integer values

# Data - Array

# Algo
# partition the array based on the elements identity*
  # true is the element is an integer?*
# assign the true array to num_array
# assign fasle arrya to char_array
# return num_array

# need to confirm how partition works
# need to devise a way to reliably check if an element is an integer
# need to remember how to assign multiple variables to the output of
# partition


def filter_list(array)
  num_array, char_array = array.partition {|element| element.is_a?(Integer)}
  num_array
end


p filter_list([1,2,'a','b']) == [1,2]
p filter_list([1,'a','b',0,15]) == [1,0,15]
p filter_list([1,2,'aasf','1','123',123]) == [1,2,123]