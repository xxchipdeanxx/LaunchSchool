#Write a method that takes two strings as arguments, 
#determines the longest of the two strings, and then returns the result of 
#concatenating the shorter string, the longer string, and the shorter string 
#once again. You may assume that the strings are of different lengths.

#Problem
#Write a method that finds the shortest string, and sandwiches the longer
#string between two instances of the short string. 

#Rules
#input - string
#output - concat. string --> no spaces

#No spaces
#Only two string
#Concat short str + long str + short str

# Data - Array?

#Algo
# determine which string is shortest --> legnth
# save that value as short
# the other value is long by default
# retuen short + long + short

def short_long_short(str1, str2)
  long_str = str1.size > str2.size ? str1 : str2
  short_str = long_str == str1 ? str2 : str1

  short_str + long_str + short_str
end





p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"