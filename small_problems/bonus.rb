#Write a method that takes two arguments, 
#a positive integer and a boolean, and calculates 
#the bonus for a given salary. If the boolean is true, 
#the bonus should be half of the salary. 
#If the boolean is false, the bonus should be 0.

#Problem
#Calculate the expected bonus amount. If true is an argument
# bonus is equal to half of the salary
# if false is an argument --> no bonus. reutrn 0

#Input - integer (salary) boolean (true or false) --> bonus?
#Output- bonus amount (salary/2) or 0

#Rules
#bonus is half of salary
#only when true is passed do we get a bonus
# if false is passed --> 0
# a bool param is always provided
# all salary will be integer numbers

#Data - Integer, FalseClass, TrueClass

#Algo
# create a ternary operation
  # bonus ? (salary/2) : 0

def calculate_bonus(salary, get_bonus)
  get_bonus ? (salary / 2) : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000