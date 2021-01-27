#Write a method that computes the difference between the square of the sum of 
#the first n positive integers and the sum of the squares of the first n 
#positive integers.

#Rules
#input - a max integer
#output - the difference between taking the sum of (1..max)**2 and (1**2 + 2**2 +..max**2)

#input will always be an integer

#Data - Array

#Algo
#create two seperate methods to calc
  # sum and square
  # square and sum
# calc the difference between the two operations

#sum and square
#(1..num).to_a.sum ** 2

#square and sum
#(1..num).to_a.map! {|num| num**2}
# sum the final array

def sum_and_square(num)
  (1..num).to_a.sum ** 2
end

def square_and_sum(num)
  squares = (1..num).to_a.map! {|num| num ** 2}
  squares.sum
end

def sum_square_difference(num)
  sum_and_square(num) - square_and_sum(num)
end

p sum_square_difference(3) == 22
  #  -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150