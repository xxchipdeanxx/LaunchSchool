#ROT13 is a simple letter substitution cipher that replaces 
#a letter with the letter 13 letters after it in the alphabet. 
#ROT13 is an example of the Caesar cipher.

#Create a function that takes a string and returns the string
#ciphered with Rot13. If there are numbers or special characters 
#included in the string, they should be returned as they are. 
#Only letters from the latin/english alphabet should be shifted, 
#like in the original Rot13 "implementation".

#Rules
# only latin/english characters should be converted
# all other characters should remain unconverted
# method should respect cases
  #- Test --> Grfg
  #- test --> grfg

#Input - a string, could have spaces
#Output -  that string encyphered with ROT13

#Data - String, Array, Range(?)

#Consider
# Strings map to their ASCII numbers on the table (.ord/.chr)
  # 'a'.ord --> 97
  # 97--> 'a'
# ASCII values do not loop around
  # 't'.ord --> 116
  # (116 + 13).chr --> '\x01' NOT 'g'
# convert the incoming string into ASCII values in an array
# map! over the array
# if an elment is going to go past either 'z' or "Z"
  # - (char_num + 13) > 90 or (char_num + 13) > 122
  # - we must determine how many moves it takes to get to the last letter
  # - (122 - (char_num+1)) --> spaced moved to end
  # 13 - (122 - (char_num+1)) --> remaining moves
  # 'a' or "A" + remaining moves
# else return the origional object


# I rant into some problems during implementaiton.
# I was always 2 values off target when using my 
# if..elsif conditions
# I origionally had:
  # 97 + (13 - (122 - (char_num + 1)))

# I also forgot that map! will reuturn nil unless otherwise
# specified. So while my block handled all roman, alphabet
# chacters. It was returning nil for any other characters
# including spaces, and punctuation
# this would cause an error when I tried to implement .chr
# on line 76 because my array was loaded with nil values whereever
# there was a character that wasn't handled by my conditional statements

# Two big lessons learned:
# When are values 'counted'
# Be aware to return the origional object during map
  # assuming you only want to transform specific object
  # but maintain the values of all other elements

require 'pry'
require 'pry-byebug'


def rot13(string)
  ord_array = string.bytes.map! do |char_num|
    if 65.upto(90).include?(char_num)
      if char_num + 13 > 90
        64 + (13 - (90 - (char_num)))
      else
        (char_num + 13)
      end
    elsif 97.upto(122).include?(char_num)
      if char_num + 13 > 122
        96 + (13 - (122 - (char_num)))
      else
        (char_num + 13)
      end
    else
      char_num
    end
  end
  ord_array.map! {|ord_num| ord_num.chr}.join
end

# p rot13("test") == 'grfg'
# p rot13("Test") == 'Grfg'
# p rot13('s') == 'f'
p rot13('Z')
# p rot13('10+2 is twelve.')