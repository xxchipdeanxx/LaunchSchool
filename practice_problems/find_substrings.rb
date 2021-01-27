#Given two strings, determine if each string shares a common substring.
# Return TRUE is both strings do, and FALSE is they dont.
# A substring must be AT LEAST two characters long.

## Rules ##
# the method is case insensative
# blank strings return false automatically
# numbers can count as matching substrings
# a substring must have at least two chars in common to 'match'

#Input - two strings
#Output - true or false

# Data - Array -- due to the number of iterations needed

## ALGO ##
# if either string.size == 0 --> return false
# determine which string is shortest
# assign the shorter string to short_string
# the other to long_string
# downcase both variables (short and long)
# break the smallest string into an array of its component chars
  # - ['F', 'u', 'n']
# Iterate through the short_str arr with index * (matching_strings?)
  # - set sample length == array.size + index --> since a substring must at least be 2 chars
  # - generate all possible sub strings
  #   - until sample_length == array.size
  #     - small_arr[index, sample_length]
  #     - ['F', 'u', 'n']
  #     - small_arr[0, 2] --> ['F', 'u']
  #     - small_arr[0,3] --> ['F', 'u', 'n']
  #     - small_arr[1,2] --> ['u', 'n']
# if the second string includes (include?) the joined string_sample
  # - return true
# if no matches return false

def substring_test(str1, str2)
  if str1.size < str2.size
    short_str = str1.downcase
    long_str = str2.downcase
  else
    short_str = str2.downcase
    long_str = str1.downcase
  end

  short_char_arr = short_str.chars

  (0...short_char_arr.size).each do |index|
    sample_length = 2
    substring = short_char_arr[index, sample_length].join
    return true if long_str.include?(substring) && substring.size > 1
    sample_length += 1
  end
  false
end



p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('Test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrocious') == true
