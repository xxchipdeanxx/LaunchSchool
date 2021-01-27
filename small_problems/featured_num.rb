#Write a method that takes a single integer as an argument, 
#and returns the next featured number that is greater than the argument. 
#Return an error message if there is no next featured number.

#A featured number (something unique to this exercise) is an odd number that 
#is a multiple of 7, and whose digits occur exactly once each. 

#So, for example, 49 is a featured number, but 98 is not (it is not odd), 
#97 is not (it is not a multiple of 7), 
#and 133 is not (the digit 3 appears twice).

#Problem
#given a number; generate the next 'featured num' (if possible)

#Rules
#input - integer
#output - either an integer or an 'error message'

# Featured Number
  # an odd number
  # a multiple of 7
  # no repeating digits

#invalid generators
  # where the num of digits on the input is greater than 9

#Data - Array

#Algo
# if the input.to_s.chars is larger than 9 --> error message
#iterate until the featured num condition is sastified
  # check number against featured_num?(num)
  # if no match --> num +=1
# once the condition is met --> return the number

require 'pry'

def no_repeat_digits?(num)
  digits = num.to_s.chars
  digits.all? {|digit| num.to_s.count(digit) == 1}
end

def featured_num?(num)
  num.odd? && num % 7 == 0
end

def featured(num)
  num += 1
  num += 1 until featured_num?(num)
  loop do
    return num if no_repeat_digits?(num)
    num += 14
    break if num >= 9_876_543_210
  end
  'Can not calculate'
end

# binding.pry
# p featured_num?(35)
# p featured_num?(1043)

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements