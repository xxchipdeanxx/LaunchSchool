#Write a method that calculates and returns the index of the first Fibonacci 
#number that has the number of digits specified as an argument. 
#(The first Fibonacci number has index 1.)

#Problem
# calc fib numbers and return the index for the first fib num generated
# that has the amount of digits supplied by the argument

#Rules
#input - an integer --> desired num of digits
#output - in integer --> index of the first fib num to have 'n' digits

#Fib array is NOT zero index. It begins at one
#Fib number is the sum of the previous two numbers

#Data - Array

#Algo
#generate fib numers in an array until the num of digits == input num*
  #initilize an array [1,1]
  # create a loop to generate fib numbers --> until
    # array << array.last(2).sum
  # if the element loaded meets the criteria
  # return array.size
  # else keep iterating
#return the index of that element plus one


def count_digits(num)
  num.to_s.chars.size
end

def find_fibonacci_index_by_length(digits)
  fib_array = [1,1]
  until count_digits(fib_array.last) >= digits
    fib_array << fib_array.last(2).sum
  end
  fib_array.size
end






p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847