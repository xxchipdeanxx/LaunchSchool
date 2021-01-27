#Write a method that takes one argument, a positive integer, 
#and returns the sum of its digits.

#Rules
#Input - integer
#Output - integer --> sum of all component digits

#Data - Array

#Algo
#break number up into component digits --> array (str)
#iterage over the array and convert to integer
# sum the contents of the array
# return the number

def sum(input_number)
  digit_ary = input_number.to_s.chars
  digit_ary.map(&:to_i).sum
end






puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45