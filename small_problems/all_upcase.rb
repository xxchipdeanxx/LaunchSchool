#Write a method that takes a string argument, and returns true if all of the 
#alphabetic characters inside the string are uppercase, false otherwise. 
#Characters that are not alphabetic should be ignored.

#Problem
#check the string to ensura all alpha. chars are upcased

#Rules
#input - string
#output - bool 

#only consider alpha. chars towards consideraiton
  # 'skip' nums and spaces

#a blank char should be consiered upcased and return true

#Data - Array

#Algo
# break the string into characters
#iterate through the chars
#if the char is a letter
  #determine if it is upcased
# if so --> continue to eval
# if its a non letter char --> consider it true
# return the bool for the overall array

#opt 2
# pull only the alpha chars and check to see if all are upcased

require 'pry'

# def uppercase?(string)
#   chars = string.chars
#   chars.map! do |char|
#     if /[[:alpha:]]/.match(char)
#       ('A'..'Z').include?(char)
#     else
#       true
#     end
#   end
#   chars.all?
# end

# def uppercase?(string)
#   string.scan(/[[:alpha:]]+/).all? {|word| word.upcase == word}
# end

def uppercase?(string)
  string.upcase == string
end

# binding.pry
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true