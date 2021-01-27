#In this exercise, you are going to compute a method that returns the last 
#digit of the nth Fibonacci number.

# def gen_fib_seq(nth)
#   fib_seq = [1,1]
#   (nth-2).times do 
#     fib_seq <<  fib_seq.last(2).sum
#   end
#   fib_seq
# end

require 'pry'

def fibonacci_last(nth)
  last_2 = [1,1]
  3.upto(nth) do 
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end






# binding.pry
# p fibonacci_last(123_456_789_987_745) #=> 5
p fibonacci_last(12)
p fibonacci_last(12345)
# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(1234567899) # -> 4