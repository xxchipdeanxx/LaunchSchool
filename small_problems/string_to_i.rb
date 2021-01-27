#Create your own string.to_i method that does NOT use any easy conversion
#features from Ruby. #Do not worry about (+/-) signs as well

#Rules
#don't worry about singage
#Input - string
#output - integer

# can't use to_i or Integer()

#Data - Array

#Algo
#get each 'digit' in the string alone
# determine what integer value should be assigned based on the char
# add each digit upon eval to an arrray
# condense the array into final number

# condesne array into final whole number

require 'pry'

DIGIT_HASH = 
{
  '0' => 0,
  '1'=> 1,
  '2'=> 2,
  '3'=> 3,
  '4'=> 4,
  '5'=> 5,
  '6'=> 6,
  '7'=> 7,
  '8'=> 8,
  '9'=> 9
}.freeze

def string_to_integer(string)
  sign = string.slice!('-') ? -1 : 1
  digits = string.chars
  digits.map! {|char| char_to_int(char)}
  num = digits.inject{|a,i| a*10 + i}
  num * sign
end

def char_to_int(char)
  DIGIT_HASH[char]
end 


p string_to_integer('-4321') == -4321
# string_to_integer('570') == 570