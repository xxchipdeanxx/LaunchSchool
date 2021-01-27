#Write a method that takes an Array of integers as input, multiplies all the 
#numbers together, divides the result by the number of entries in the Array, 
#and then prints the result rounded to 3 decimal places. Assume the array is 
#non-empty.

#Problem
#multiply all elements of the array
#divide the final product by the num of entries
#round the number to 3 dec. points
# return the number

#Rules
#input - array of integers
#ouput - string

#arrays will never be empty
# will contain integer numbers

#Data - Array

#Algo
#find product of all element in the array
# divide the final prod. by 3.0
#round the result by 3 and return the number

def show_multiplicative_average(array)
  result = (array.inject(:*) / array.size.to_f)
  puts "The result is #{format('%.3f', result)}"
end


p show_multiplicative_average([3, 5])               # => The result is 7.500
p show_multiplicative_average([6])                  # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667