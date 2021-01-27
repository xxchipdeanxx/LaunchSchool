# The maximum sum subarray problem consists of finding the maximum
# sum of a contiguous sub sequence in an array of integers.

#

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]

# Easy case is when the array only has positive integers -->
  # - return the sum of the entire array
# If the array only contains negative integers --> return 0
# Empty arrays as inputs should return 0 as well

#Input - an array of integers or empty array
#Ouput - the max number that can be generated with sub numbers OR 0

#Only positive integers --> sum of entire array
#Only negative integers --> 0
#Array is empty -->

# Max number must be the largest num generated in sequence
  # can not hop around and pluck only positive integers
  # all numbers must be in a sequence

#if array.empty? --> 0
#* elsif all_negative?(input) --> 0 
# elsif all_positive(input) --> array.sum
#else find_largest_sequence*
#return result

# How to find the largest sequence?
# set first element to current_max
# iterate through the entire array --> -2, 1, 7, ...
  # - start at first element and increase sample lenght
  #   - [-2]..[-2,1]...[-2,1,7]...
  # - if the sample array.sum is larger than current_num
  #   - current_num = new_number
  #   - break
  # - num_array.each_index do |index| --> -2, 1, 7, ...
  #   sample_length = 2
  #   until sample_length == array.size
  #     new_number = num_array[index, sample_length].sum


def max_number(num_array)
  current_num = num_array.first

  num_array.each_index do |index|
    sample_length = 1

    until sample_length > num_array.size - index
      new_num = num_array[index, sample_length].sum 
      current_num = new_num if new_num > current_num
      sample_length += 1
    end
  end
  current_num
end

def maxSequence(num_array)
  if num_array.empty? || all_negative?(num_array)
    0
  elsif all_positive?(num_array)
    num_array.sum
  else
    max_number(num_array)
  end
end

def all_positive?(num_array)
  num_array.all? do |element|
    element >= 0
  end
end

def all_negative?(num_array)
  num_array.all? do |element|
    element < 1
  end
end

p maxSequence([]) == 0
p maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p maxSequence([11]) == 11
p maxSequence([-32]) == 0
p maxSequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
p maxSequence([10,-1,-2,6,-4]) == 13




