# Double the number stored at a array's index IF the index number is ODD
# my_numbers = [1, 4, 3, 7, 2, 6]
# double_odd_index(my_numbers) --> [1, 8, 3, 14, 2, 12]

## RULES ##
#Double the number only if the index is odd
# All numbers should be in return array
#Input: an array of numbers
#Output: a NEW array containing all elements (some will be mofidied)

## ALGORITHM ##
# 1. loop through each array element
# 2. IF the index number is ODD, double the integer stored at the index
# 3. each element is appended into a new array
# 4. the loop breaks once all array elements have been iterated through
# 5. return the new array

def double_odd_index(array)
  return_array = []
  count = 0
  until count == array.size
    current_num = array[count]
    current_num *= 2 if count.odd?
    return_array << current_num
    count += 1
  end
  return_array
end