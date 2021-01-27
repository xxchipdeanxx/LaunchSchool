#Write a method that takes a sentence string as input, and returns the same 
#string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
#'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

#Problem
#given a string; return the string with the numbers (words) replaced by their digit
#representations

#Rules
#input - string
#output - string with the digits converted

#num must also keep any punct behind it

#Data - Array

#Algo
#break the string into words
#scan each word to see if it matches a number
# replace the word with the digit representation of that word
#join all elements of the array into a string
# return the string

require 'pry'

NUM_WORDS = %w(zero one two three four five six seven eight nine)
NUM_DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
NUMBERS = {
  'zero': '0',
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9'
}


def format_phone_num(string)
  phone_num = string.scan(/\d/).join
  final_phone = phone_num.dup.insert(0,'(').insert(4,')').insert(8,'-')
  string.gsub!(phone_num,final_phone)
end

def word_to_digit(string)
  words = string.split
  NUMBERS.keys.each do |word|
    string.gsub!(/#{word}\p{Space}?/, NUMBERS[word])
  end
  format_phone_num(string)
end

# def replace_with_digit(word)
#   digit = NUM_DIGITS[NUM_WORDS.index(word.delete('.'))]
#   word.gsub(word.delete('.'), digit)
# end

# def word_to_digit(string)
#   words = string.split
#   words.map! do |word|
#     if NUM_WORDS.include?(word.delete('.'))
#       replace_with_digit(word)
#     else
#       word
#     end
#   end
#   words.join(' ')
# end

# binding.pry
p word_to_digit('Please call me at eight zero five five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
