#Write a method that takes one argument, a positive integer, 
#and returns a string of alternating 1s and 0s, 
#always starting with 1. The length of the string should match 
#the given integer.

#Problem
#Write a method that take an integer as an argument and returns
# a string of alternating 1's and 0's. The size of the string equals
# the input number. The string always begins with a '1'

#Rules
#input num determines the size of the string
# 1's and 0's alternate 
# '1' always begins the string

#Ouput is a single string. Not a series of puts statements

#Input -Integer
#Output - String --> alternating '1's' and '0's'

#Data - Range

#Algo
# create a digit_container
# establish a range from 1 to the input num (inclusive)
  #(1..10)
# iterate though the range 
  # if the number passed into block is odd (ternary statement?)
    # array << 1
  # else
    # array < 0
# after the array is loaded --> join to get a string output


def stringy(num, lead_digit = 1)
  digit_arr = []
  digit_2 = lead_digit.odd? ? 0 : 1  

  (1..num).each do |number|
    number.odd? ? digit_arr << lead_digit : digit_arr << digit_2
  end
  digit_arr.join
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6,0) == '010101'
puts stringy(9,0) == '010101010'
puts stringy(4,0) == '0101'
puts stringy(7,0) == '0101010'