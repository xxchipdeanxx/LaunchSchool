#Write a method that takes one argument, a string, 
#and returns a new string with the words in reverse order.

#Problem
#Write a method that rearranges a sentance in reverse order

#Rules
#Input - A string sentance
#Output - a NEW string that is the reverse order of the input string

#Data - Array

#Algo
# split the string into its component words -->
# reverse the array order
# join the reverse array and return the string


def reverse_sentence(input_str)
  input_str.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'