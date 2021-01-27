#Given a string of words separated by spaces, write a method that takes this 
#string of words and returns a string in which the first and last letters of 
#every word are swapped.

#You may assume that every word contains at least one letter, and that the 
#string will always contain at least one word. You may also assume that each 
#string contains nothing but words and spaces

#Problem
# given a string - swap first char with last char for every word

#Rules
#input - string
#output - string

#single letter words -- unchanged
# respect cases during shift
# string will never be empty --> one word

#Data - Array

#Algo
# break down each string into words
# iterate through each word and modify if neccessary *
  # respect cases
# join the array back togeather
# return string

require 'pry'


def swap(string)
  words = string.split
  words.map! {|word| swap_letters(word[0],word[-1])}
  words.join(' ')
end

def swap_letters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end





p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'