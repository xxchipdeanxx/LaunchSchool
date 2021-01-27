#Rewrite your recursive fibonacci method so that it computes its results without recursion.

#Rules
#input - the nth index of a fib. sequence
#input - integer --> the fib number existing at the nth index

# [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233,...]

#Data - Array

#Algo
#generat the fib sequence up to the nth index
  #begin with an array of [1,1]
  # take 2 and sum and append
  # go until the nth index minus two since we've created the first two enteries
#report the last number generated
#return the number at the last index

# def gen_fib_seq(nth)
#   fib_seq = [1,1]
#   (nth-2).times do 
#     fib_seq <<  fib_seq.last(2).sum
#   end
#   fib_seq
# end

# def fibonacci(nth)
#   gen_fib_seq(nth).last
# end

require 'pry'

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end


binding.pry
p fibonacci(8) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501