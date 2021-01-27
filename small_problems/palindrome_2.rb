require 'pry'
require 'pry-byebug'

#Write another method that returns true if the string passed as an argument 
#is a palindrome, false otherwise. This time, however, your method should be 
#case-insensitive, and it should ignore all non-alphanumeric characters. 
#If you wish, you may simplify things by calling the palindrome? method you 
#wrote in the previous exercise.

#Problem -- Write a method that will return true or false if 
# an incoming string is a palaindrome.
  # only letters and numbers count towards palindrome
  # spaces, punct...don't matter

#Rules
#ingnore any non number/letter chars towards condsideraiton
#Input - string
#Output - true or false

#Data - Array

#Algo
#break down the string into component letters
#only consider the letters and numbers --> strip out
# strip chars that don't count
# reverse the string
# compare the two strings
# return true if str 1 == str 2
# false otherwise



def real_palindrome?(string)
  chars = string.downcase.chars.select {|char| /[[:alnum:]]/.match(char)}
  chars == chars.reverse
end

p real_palindrome?('madam') == true
p  real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p  real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
