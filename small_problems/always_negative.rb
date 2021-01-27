#Write a method that takes a number as an argument. 
#If the argument is a positive number, return the negative of that number. 
#If the number is 0 or negative, return the original number.

#Rules
#input - integer --> any sign
#output - integer --> either 0 or neg. num

#if the input is positive --> return a neg num
#if the input is either neg or 0 --> return the number

#Data - 

#Algo
#determine if the number is positive
# if so mult. by -1 and return
#else simply return the num

def negative(num)
  num > 0  ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby