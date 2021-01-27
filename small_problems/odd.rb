#Write a method that takes one integer argument, 
#which may be positive, negative, or zero. 
#This method returns true if the number's absolute value is odd. 
#You may assume that the argument is a valid integer value.

#Problem
#Write a method that takes a valid integer (negative,0,positive)
# and returns true of the ABSOLUTE value of the number is odd.
# False otherwise

#Can not use #odd? or #even?

#Rules
#Input - A valid integer
#Ouput - true or false

#Returns true if the ABSOLUTE value is odd
# returns false otherwise

#Data - Integer

#Algo
#how to calc absolute value (.abs) --> Integer
# num % 2 == 1 (odd)


#REWRITE the method to work if a remainder was provided instead

# def is_odd?(number)
#   number % 2 == 1
# end

def is_odd?(num)
  num.remainder(2) != 0
end

puts is_odd?(2) == false
puts is_odd?(5) == true
puts is_odd?(-17) == true
puts is_odd?(-8) == false
puts is_odd?(0)  == false
puts is_odd?(7)  == true