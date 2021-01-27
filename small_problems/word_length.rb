#Write a method that takes a string as an argument, and returns an Array that 
#contains every word from the string, to which you have appended a space and 
#the word length.

#You may assume that words in the string are separated by exactly one space, 
#and that any substring of non-space characters is a word.

#Problem
#given a string; ouput an arrya that contains the word and the number of
# chars in the string --> as a singl string unit. 

#Rules
#input - string
#output - an array of words and their char count

#empty string should return an empty array
#Assume that string will never be empty
#string will always be seperated by exactly one space

#Data - Array

#Algo
#break each string up into is component words
# iterate through each word and append a space and a char count to each
# string
# return the final array

def word_lengths(string)
  words = string.split
  words.map! do |word|
    word << " #{word.size}"
  end
  words
end



p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []