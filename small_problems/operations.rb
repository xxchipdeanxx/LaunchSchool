#Write a program that prompts the user for two positive integers, 
#and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. 
#Do not worry about validating the input.

#Problem
# get (2) integers from the user --> perform (6) different operations

#Rules
#Input - two integers --> no validation needed
#Output - a series of strings:
  # display both numbers, operation, and the result

#Output string has specific format

#Data - 

#Algo
# get two integers from the user
# use both integers to perform (6) different operations
# display each operation to the console

def operations
  puts "==> Enter the first number:"
  num_1 = gets.chomp.to_i
  puts "==> Enter the second number:"
  num_2 = gets.chomp.to_i

  puts "==> #{num_1} + #{num_2} = #{num_1 + num_2}"
  puts "==> #{num_1} - #{num_2} = #{num_1 - num_2}"
  puts "==> #{num_1} * #{num_2} = #{num_1 * num_2}"
  puts "==> #{num_1} / #{num_2} = #{num_1 / num_2}"
  puts "==> #{num_1} % #{num_2} = #{num_1 % num_2}"
  puts "==> #{num_1} ** #{num_2} = #{num_1 ** num_2}"
end

operations



# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103