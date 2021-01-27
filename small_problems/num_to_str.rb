#Write a method that takes a positive integer or zero, 
#and converts it to a string representation.

#Problem
#take in a integer and output a string representation of it.
# can't use to string methods

#Rules
#Input - integer
#Output - String

# zero should output something


#Algo
# break the number up into is respective digits --> digit array
# create an empty string
# iteraget through the digit array and append each digit to the sring
# return the final string

#get each digit of the number
  # method? --> digits/ reverse


def integer_to_string(number)
  digits = number.digits.reverse
  digits.join
end





p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'