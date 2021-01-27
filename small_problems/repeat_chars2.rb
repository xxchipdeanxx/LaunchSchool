#Write a method that takes a string, and returns a new string in which every consonant 
#character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and 
#whitespace should not be doubled.

#Problem
#repeat only consonant chars in a string

#Rules
#input - string
#output -string --> only cons. char doubled

#do NOT include vowels, digits, white spaces, OR punct

#Data - Array

#Algo
#scan the string for matches
  # if char is a consonant --> double
# return either the string or the array joined

require 'pry'

UPPER = ('A'..'Z').to_a
LOWER = ('a'..'z').to_a
LETTERS = UPPER + LOWER
CONSONANTS =  LETTERS - %w(a e i o u A E I O U)

# def double_consonants(string)
#   chars = string.chars
#   chars.map! do |char|
#     CONSONANTS.include?(char) ? char * 2 : char
#   end
#   chars.join
# end

def double_consonants(string)
  string.gsub(/[[:alpha:]]/) {|char| char.match(/[aeiou]/i) ?  char : char * 2 }
end

# binding.pry
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""