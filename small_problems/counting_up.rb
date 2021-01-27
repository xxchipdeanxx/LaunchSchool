#Write a method that takes an integer argument, and returns an 
#Array of all integers, in sequence, between 1 and the argument.

#You may assume that the argument will always be a valid integer that is greater than 0.

#Problem
#given an input num. create an array containing all nums from 1 to that number

#Rules
#input - integer
#output - array

#assume that input will always be an integer and also be greater than 0

#Data - Array

#Algo
#generate all nums from 1 to input num -> inclusive
# store each num in an array
#return the array

def sequence(num)
  (1..num).to_a
end



p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]