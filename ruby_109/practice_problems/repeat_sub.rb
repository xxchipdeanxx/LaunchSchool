# Given a non empty string, check if it can be constructed by taking
# a substring of itself and appending multiple copies of the substrign
# togeather. Assume the given string consists of lowecase, English letters

#Problem
# determine if a string cam be created by repeating one of its
# substrings a nuber of times --> true or false

#Rules
# can't be the string itsef --> no prime numbers of length 
#incoming strings will be lowecase letters
#a substring can be as small as a single character
#and, in our case, as large as half the length of the string

#Input- a string of all lowercase letters
#Output- true or false

#Data - Array, String

#Observations
#if a string has a prime number for its length
# the only way a substring could contain all the elements
# is if it were the first character repeated over and over

#If not prime, sub string length can only be the size of a
#a multiple of the entire string length
  # lenth of 4
  # sub str of 1 or 2

  #length of 9
  # ONLY have a sub str of 3 chars long

#Algo
#determine the length of the incoming string
# if the length is prime --> return false
# determine the max possible substring length
# get the string broken up into characters --> chars
# iterate through the char_array being sure to include each index
# iterate from (2..max sample length)
  # return true of char_array[index, sample] * (char_array.size/sample) == sample
# if no match is found--> outside of all loops
# return false

def repeated_substring_pattern(string)
  return false if prime?(string.size)
  max_sample_length = gen_max_sample(string.size)
  (2..max_sample_length).each do |sample_size|
    return true if string.slice(0,sample_size) * (string.length / sample_size) == string
  end
end

def prime?(number)
  array = (1..number).select {|num| number % num == 0}
  array.include?(1) && array.include?(number) && array.size == 2 
end

def gen_max_sample(number)
  array = (2...number).select {|num| number % num == 0}
  array.max
end



p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true


