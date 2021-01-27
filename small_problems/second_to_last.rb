#Write a method that returns the next to last word in the String passed to 
#it as an argument.

#Words are any sequence of non-blank character

#You may assume that the input String will always contain at least two words.

#Problem
#return second to last word in the string

#Rules
#input - string
#output - string --> single word

#words are any sequence of non-blank chars

#string will always contain at least two words

#Data - Array

#Algo
#split the string into individual words
#select the -2 element of the word arrya and return the element smack
#dab in the middle
  #[1,2,3,4,5,6,7,]  #=> 4
#if the array is empty -> return an empty array
# if array is a blank string or one word --> return the single word 

# def penultimate(string)
#   string.split[-2]
# end

#opt 2
#return the middle element of the string
#if the string has an odd number of words 

require 'pry'

def penultimate(string)
  word_index = string.split.size / 2
  string.split[word_index] == nil ? '' : string.split[word_index]
end


p penultimate('last word') == 'word'
p penultimate('Launch School is great!') == 'is'
p penultimate('') == ''
p penultimate('test') == 'test'
p penultimate('This string has five words') == 'has'
