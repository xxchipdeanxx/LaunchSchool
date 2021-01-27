#Write a method that returns a list of all substrings of a string. 
#The returned list should be ordered by where in the string the substring 
#begins. This means that all substrings that start at position 0 should come 
#first, then all substrings that start at position 1, and so on. 
#Since multiple substrings will occur at each position, the substrings at a 
#given position should be returned in order from shortest to longest.

#You may (and should) use the leading_substrings method you wrote in the 
#previous exercise:

#Problem
#generate all possible sub strings that can be generated from a input string

#Rules
#input - string
#output - array --> sorted 

#array should be sorted by where the substring begins based on index AND the
#size of each substring that is derived from an index as well

#Data - Array

#Algo
#generate a range that can be used as our beginning index to sample
#call the helper method to generate all possible substrings based on the
#starting index
#store all substring generated in an array
# return the array --> check for sorting

require 'pry'

def leading_substrings(string)
  sub_strings = []
  (1..string.size).each do |sample_size|
    sub_strings << string[0,sample_size]
  end
  sub_strings
end

def substrings(string)
  sub_str = []
  (0...string.size).each do |start_index|
    sub_str << leading_substrings(string[start_index..-1])
  end
  sub_str.flatten
end

# binding.pry
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]