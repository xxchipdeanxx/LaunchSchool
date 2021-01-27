#Write a method that takes an Array of numbers and then returns the sum of the 
#sums of each leading subsequence for that Array. You may assume that the 
#Array always contains at least one number.

#Problem
# return the sum of the sum of sub sequences that can be created by the incoming
# array

#Rules
#input - single dimension array
#output - integer --> sum of all subsequence sums

#Array will always contain at least one number

#Data - Array

#Algo
#create all possible sub sequences of the array
#sum each sub sequence and store in a variable
# return the final number

def sum_of_sums(array)
  final_sum = 0
  (1..array.size).each do |sample_size|
    final_sum += array[0, sample_size].sum
  end
  final_sum
end



p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35