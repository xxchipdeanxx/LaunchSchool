#Given an array of integers, find the index number N such that the
# sum of all integers to the left of N equals the sum of all
# integers to the right of N.

# If the index N can be found --> return N
# If no index is able to be found --> return -1

# Rules #
# The number at index is NOT included in the calculation
  # left_sum ... [n] ... right_sum
# return N if left_sum == right_sum
# Indexes will not be negative
  # will not consider counting backwards if index is at 0
# if index is 0 -- the left_sum == 0
# return -1 if an index can not be found to sastify the condition
# empty arrays [] --> 0

#Input - an array of integers
#Output - the index where sum of elements to left equals sum of elements to the right
#       - OR -1 if no index can be found

#Data - Array

# Algo #
# (0..array.size).each do |current_index|
  # create left_sum and right_sum variables
  # if index == 0 left_sum = 0
  # first iteraiton:
  # array_size: 7
  # index 0
  # right_index = array[1,6].sum

  #second iterarion:
  # first_index:
  # index: 1
  # left_sum = array[0,1].sum
  # right_sum = array[2,5].sum

# left_sum = array[(current_index - 1), current_index].sum
# right_sum = arry[(current_index + 1), (array.size - current_index)]

# if left_sum == right_sum --> return current_index
# if loop finishes and never evaluates to true --> return -1

def find_even_index(array)
  (0...array.size).each do |current_index|
    left_sum = array[0, current_index].sum
    right_sum = array[(current_index + 1), (array.size - current_index)].sum

    return current_index if left_sum == right_sum
  end
  array.size == 0 ? 0 : -1
end


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index([]) == 0

