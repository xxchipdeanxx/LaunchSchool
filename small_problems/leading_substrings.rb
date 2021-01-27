#Write a method that returns a list of all substrings of a string that start 
#at the beginning of the original string. The return value should be arranged 
#in order from shortest to longest substring.

#Problem
#generate all substrings from a string and arrange them in ascending order
#based on their length

#Rules
#input - string
#output - array --> sorted

#assume the string will contain no spaces
# a single char should return itself in an array

#Data - Array

#Algo
#generate all substrings in the string
#store each substring in an array
#sort the array based on the string length 
#return the sorted array 

# def leading_substrings(string)
#   sub_strings = []
#   (1..string.size).each do |sample_size|
#     sub_strings << string[0,sample_size]
#   end
#   sub_strings
# end

# def leading_substrings(string)
#   chars = string.chars
#   sub_strings = []
#   (1..chars.size).each do |sample_size|
#     sub_strings << chars.take(sample_size).join
#   end
#   sub_strings
# end




p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']