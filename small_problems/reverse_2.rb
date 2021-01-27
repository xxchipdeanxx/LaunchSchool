#Write a method that takes one argument, a string containing 
#one or more words, and returns the given string with words that 
#contain five or more characters reversed. 
#Each string will consist of only letters and spaces. 
#Spaces should be included only when more than one word is present.

#Problem
#Write a method that takes a string and reverse individual words
#(not the order of the string) if a words contains 5 or more characters

#Rules
#Only letter and spaces will be used
#Spaces present when more than one word is present

#Input - a string
#Output - the same string? or a NEW string?

#Data - Array, String

#Algo
#break the string into component words
#Iterate through the array of words (map!)
# if the word.size is greater than or equal to 5 --> reverse
# if not simply return the origional string
# joing the rearranged array (--> don't forget space)
# return the string

def reverse_words(string)
  word_array = string.split
  word_array.map! do |word|
    word.reverse! if word.size >= 5
    word
  end
  word_array.join(" ")
end





p reverse_words('Professional') == 'lanoisseforP'
p reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
p reverse_words('Launch School') == 'hcnuaL loohcS'
