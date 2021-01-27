#Write a method that takes one argument, an array containing integers, 
#and returns the average of all numbers in the array. 
#The array will never be empty and the numbers will always 
#be positive integers. Your result should also be an integer.

#Problem
#Return the average of an array and all its contents.

#Rules
#Input - an array of integers
#Output - integer

#Array will never be empty
#numbers will always be positive integrs
# result should be an integer
# aiming for AVERAGE
# no floating points and no remainders

# Data - Array

#Algo
#find the sum of all integers in the array
# divive the sum by the number of elements (.size)
# reutrn that number

def average(array)
 array.sum / array.size
end



puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40