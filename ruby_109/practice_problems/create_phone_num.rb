# Write a function that accepts an array of 10 integers 
# (between 0 and 9), that returns a string of those numbers 
# in the form of a phone number.

#The returned format must be correct in order to complete 
#this challenge.
#Don't forget the space after the closing parentheses!

#createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) 
# => returns "(123) 456-7890"


# Rules
# Output MUST fit the exact format --> "(123) 456-7890"
# Input will alwyas be an array of 10 integers

#Input -  an array of 10 integers
#Output - a string fitting a specific format

#Data - Array and String

#Algo
# use string interpolation to insert the indexes of the array

# def createPhoneNumber(arr)
#   "(#{arr[0,3].join}) #{arr[3,3].join}-#{arr[6,4].join}"
# end

def createPhoneNumber(array)
  '(%d%d%d) %d%d%d-%d%d%d%d' % array
end

p createPhoneNumber([12.5, 2, 3, 4, 5, 6, 7, 8, 9, 0]) 
