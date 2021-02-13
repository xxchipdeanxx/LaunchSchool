# Given an array of strings made only from lowercase letters
# return an array of all characters that show up in all strings
# within the given array (including duplicates)

# For example, if a character occurs 3 times in all strings
# but not 4 times, you need to include that character three times
# in the final answer

#return all characters that occur in all strings. include all
#duplicate repeats.
  # 'bella', 'label', and 'roller' all 2 occurances of 'l' --> ['e','l','l']

#Rules
#Input -  an array of strings
#Output - an array of all strings that occur in all strings and their frequency

#no matches should return an empty array
#all strings will be lowercased letters --> downcase to confirm
#repeat chars in all strings should be included as individual chars
#in the final array

#Data - Hash, Array

#Algo
#create an empty array
#break down the first word into its componenet characters
#check each character against all other chars in the stirngs
#if there is a match --> populate the char in our final array
#remove the matched char from the other strings being matched
# to prevent overstating their occurence
# return the final array

def common_chars(input_array)
  final_array = []
  local_array = input_array.map {|word| word.dup}
  char_array = local_array.shift.chars

  char_array.each do |letter|
    if local_array.all? {|word| word.include?(letter)}
      final_array << letter
      local_array.each {|word| word.slice!(letter)}
    else
      next
    end
  end
  final_array
end


p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'ggrrrrr', 'yyyzzz']) == []