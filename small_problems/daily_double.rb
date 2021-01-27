#Write a method that takes a string argument and returns a new string that 
#contains the value of the original string with all consecutive duplicate 
#characters collapsed into a single character. 
#You may not use String#squeeze or String#squeeze!.

#Problem
#remove all duplicates of consecutive chars in a string

#Rules
#input - string
#output - string

#input will not ever be words like book, cool, pool

#single chars should be returned
#empty string returns an empty string
#focusing on the substrings
  # abc is considered a repeat

#Data - Array

#Algo
#break the string into component words
#sample through each word and reduce the number of duplicates
  # load a new array and not add if last elelemtn equals current
#join the remainign array -- string
# return the final string


def char_strip(word)
  final_word = []
  (0...word.size).each do |index|
    final_word << word[index] if final_word.last != word[index]
  end
  final_word.join
end

def crunch(string)
  words = string.split
  words.map! {|word| char_strip(word)}.join(' ')
end


char_strip('ddaaiillyy')

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''