#In the modern era under the Gregorian Calendar, 
#leap years occur in every year that is evenly divisible by 4, 
#unless the year is also divisible by 100. If the year is evenly divisible by 
#100, then it is not a leap year unless the year is evenly divisible by 400.

#Assume this rule is good for any year greater than year 0. 
#Write a method that takes any year greater than 0 as input, and returns 
#true if the year is a leap year, or false if it is not a leap year.

#Problem
# determine if a year is a leap year

#Rules
#Input - integer --> year
#Output - true or false

# Leap year ==
  # true if num % 4 == 0
    # unless num % 100 == 0
  # if num % 400 == 0 --> yes as well

#Data - 

#Algo
#determine if a number is first divisible by 400
# if not by 400 -- then check divisible by 100 --> if yes --> falase
# if not divisible by 400 or 100 --> check divisible by 4


#Part 2
#The British Empire adopted the Gregorian Calendar in 1752, which was a leap 
#year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, 
#leap years occur in any year that is evenly divisible by 4.



require 'pry'

def leap_year?(year)
  if (1..1752).include?(year)
    year % 4 == 0
  else
    return true if year % 400 == 0
    return false if year % 100 == 0
    year % 4 == 0
  end
end



#binding.pry
# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true