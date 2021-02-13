# Write an method to find the longest prefix string amongst an arry of strings

# If there is no common prefix --> return an empty string ""

# Eamples #
#Input - ['flower', 'flow', 'flight']
#Output - 'fl'

#Input - ['dog', 'racecar', 'car']
#Output - ""

# Rules #
# all inputs will be an array of lowercase strings a-z
# if no matches --> return '' (empty string)

#Input - an array of strings
#Output - the longest prefix shared amongst all strings OR "" if there are no shared prefixes

# Data - array

# Algo #
# - break the first string down into its component characters
#   - array.shift.chars --> ["f", "l", "o", "w", "e", "r"]

# - iterate through the characters array (select) --> ['f', 'l']
#   - determine if each other word contains the character at the specific index
#   - compare the charatcer at its index against the other strings at the same index
#     - index - 0
#     - char - 'f'
#     array.all? {|string| string[index] == char}
# - if resulting array is empty --> ""
# -else return resulting array .join

def common_prefix(array)
  return '' if array.empty?
  local_array = array.dup
  first_element_chars = local_array.shift.chars

  matched_chars = []

  first_element_chars.each_index do |index|
    if local_array.all? { |string| string[index] == first_element_chars[index] }
      matched_chars << first_element_chars[index]
    end
  end
  
  if matched_chars.empty?
    ''
  else
    matched_chars.join
  end
end


array = ['flower', 'flow', 'flight']
p common_prefix(array) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
p common_prefix([]) == ''
