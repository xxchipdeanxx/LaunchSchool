#Take 2 strings s1 and s2 including only letters from ato z. 
#Return a new sorted string, the longest possible, 
#containing distinct letters.

#Examples
# a = "xyaabbbccccdefww"
# b = "xxxxyyyyabklmopq"
# longest(a, b) -> "abcdefklmopqwxy"

# a = "abcdefghijklmnopqrstuvwxyz"
# longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"

#Problem
#Given two strings, created a sorted string that is a combination of
#the two strings. Letters can only occur once in final string. Seeking
#the longest possible string.

#Rules
#The same string can be input twice
#Seeking all unique occurances of each char when the strings are combined
#Ouput should be the longest possible string
#A string that is use twice should ouput itself

#Input- two strings
#Output - the longest string containing all chars from each of the strings.
# A char only needs to be represented once

#Date - String, Array

#Algo
# add both strings togeather
# create a char_array = []
# create a letter_array --> str.chars
#iterate over the letter_array
  # (0...letter_array.size)
    # char_array << letter unless char_array.include?(letter)
#
#sort the char_array in ascending order
#join the array into a single string

def longest(str1,str2)
  letter_array =  (str1 + str2).chars
  char_array = []
  letter_array.each do |letter|
    char_array << letter unless char_array.include?(letter)
  end
  char_array.sort.join
end

a = "xyaabbbccccdefww"
b = "xxxxyyyyabklmopq"
p longest(a, b) ==  "abcdefklmopqwxy"

a = "abcdefghijklmnopqrstuvwxyz"
p longest(a, a) == "abcdefghijklmnopqrstuvwxyz"
