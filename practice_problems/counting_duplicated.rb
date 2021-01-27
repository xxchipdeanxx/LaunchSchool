#Write a function that will return the count of distinct 
#case-insensitive alphabetic characters and numeric digits 
#that occur more than once in the input string. 
#The input string can be assumed to contain only alphabets 
#(both uppercase and lowercase) and numeric digits.

## EXAMPLES ##
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

## RULES ## 
# 1. method should not care about case --> "a" and "A" are considred the "same"
# 2. Numbers will only be Integers --> can be positive or negative
# 3. All inputs have NO SPACES or non alphabetical or Integer characters
# 4. In order to 'match' a character must appear more than once

#input: a string of characters --> numbers and alphabetical (up and lower case)
#output: Integer representing the number of characters that occur at least twice in a string

## OBSERVATIONS ## 
# 1. "a" and "A" ARE considered a match

## ALGO ## 
# 1. Doncase the incoming argument and save to a local variable 
# 2. split each character into an array --> each index holds one character
#     - .chars
  # 3. iterate through the text_array with select --> an array containing only characters that occur two or more times
  #   - down_case_str.count(char) >= 2

# def duplicate_count(text)
#   text_arr = text.downcase.chars
#   matched_chars = []
#   text_arr.each do |char|
#     if  text_arr.count(char) >= 2 && !matched_chars.include?(char)
#       matched_chars << char
#     end
#   end
#   matched_chars.size
# end

def duplicate_count(text)
  num_arr = ('0'..'9').to_a
  char_arr = ('a'..'z').to_a
  match_arr = num_arr + char_arr
  match_arr.count { |c| text.downcase.count(c) > 1 }
end

p duplicate_count("aA11")
