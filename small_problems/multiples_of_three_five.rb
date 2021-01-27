#Write a method that searches for all multiples of 3 or 5 that lie between 1 
#and some other number, and then computes the sum of those multiples. 
#For instance, if the supplied number is 20, the result should be 
#98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

#You may assume that the number passed in is an integer greater than 1.

#Problem
# Generate all numbers from 1 to a given number
# if the number is a multiple of 3 or five --> consider it in your final sum

#Rules
# only consider multiples of 3 and 5
# the range is from 1 to the input num
# input num will always be greater than 1

#Input - integer
#output - integer --> sum of matching elements

# Data - Array

# Algo
#create a range and find only numbers that are:
  # multiple of either 3 or 5
# add any matches to an outter array
# sum the outter array and return the integer

def multisum(number)
  (1..number).select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end



p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168