#Write a recursive method that computes the nth Fibonacci number, 
#where nth is an argument to the method.

#Rules
#input - integer --> the nth number in the fib. seq
#output - integer --> fib num

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

require 'pry'

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765




# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end

# p sum(2)
# p sum(3)
# p sum(4)