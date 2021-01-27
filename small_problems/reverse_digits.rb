#Write a method that takes a positive integer as an argument and returns 
#that number with its digits reversed.

#Rules
#input - an integer
#output - a integer that is the reverse of the input

#do NOT worry about leading 0's, Ruby will omit them

#Data - Array

#Algo
#convert the integer into a string
#break the sting into digits
# reverse the array
# join the array elements togeather and convert to an integer
#return the new integet value

def reversed_number(integer)
  integer.to_s.chars.reverse.join.to_i
end





p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1