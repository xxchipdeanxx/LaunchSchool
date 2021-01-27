#A pangram is a sentence that contains every single letter 
#of the alphabet at least once. For example, the sentence 
#"The quick brown fox jumps over the lazy dog" 
#is a pangram, because it uses the letters A-Z at least once 
#(case is irrelevant).

#Given a string, detect whether or not it is a pangram. 
#Return True if it is, False if not. 
#Ignore numbers and punctuation.

#Problem
#Check an incoming string to see if each letter of the alpahbet
# occurs AT LEAST once. Retrun true if so. False if not.

#Rules
# A pangram is a string that contains all characters of the alphabet (a-z)
# at least once.
# Case is irrelevant

#Input - a single string / sentance containing letter, punctuation, numbers
#Output - true or false

# Ignore numbers and punctuation

# Data - String, Array

#Algo
# downcase the incoming string
# check to see if each letter in (a..z) is present in the string

# option 2
#creat our letter_array --> ('a'..'z').to_a
#iterate over letter_array using (.all?)
 # the block will contain string.include?(letter)
# the return of (.all?) should only return true if all letters were
# evaluated to true within the block --> meaning they were present in the string


#option 1
# create a letter_array containing all chars (a..z).to_a
# create a char_string for the incoming string --> string.char
# iterate over the char_string and delete each character in letter_array
# return letter_array.empty?
  # if all letters (a..z) were present --> it should be empty --> return true
  # else it will return false

def panagram?(string)
  ('a'..'z').to_a.all? {|letter| string.downcase.include?(letter)}
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
