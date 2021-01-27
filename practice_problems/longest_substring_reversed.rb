# Find the length of the longest substring, in the given string,
# that is the same in reverse. 


#Empty strings will return --> 0

# Problem #
# Find the length of the longest palindrom in the given string.
# A palindrom is a substring that is the same when reversed

# Rules #
# Single letters count --> return a length of 1
# chars can be a-z or numberical
# if no palindrome exists --> return 0?

#Input - a string containing lowercase a numerical chars
#Output - an integer representing the LENGTH of the longest palindrome
# within the string. 

# Algo # 
# break down the incoming string into its component chars
  # char_array
  # string.chars --> ['b', 'a', 'a']
# largest_palindrome = 0
# generate all possible sub strings contained in the string
  # char_array.size will be our final index
  #iterate via range that will represent the indicies of the string
    # char_arr.each do |char|

# compare each substring to it's reversed version
  # if substring == substring.reverse && substring.size > largest_palindrom
      # largest_palindrome = substring.size
  # else --> next
# return largest_palindrome

require 'pry'
require 'pry-byebug'

def longest_palindrome(string)
  largest_palindrom = 0
  (0...string.size).each do |start_index|
    max_sample_size = (string.size - start_index)
    (1..max_sample_size).each do |sample_length|
      substring = string[start_index, sample_length]
      if substring == substring.reverse && (substring.size > largest_palindrom)
        largest_palindrom = substring.size
      end
    end
  end
  largest_palindrom
end

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
p longest_palindrome('') == 0


