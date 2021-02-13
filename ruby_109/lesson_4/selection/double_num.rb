#Can you implement a double_numbers! method that mutates its argument?

## EAMPLE ##
# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
# my_numbers = [2, 8, 6, 14, 4, 12]

## RULES ##
# double_numbers! is a destricutive method that modifies the argument passed
# Input: An array
# Output: The SAME array that was passed as an INPUT/ARGUMENT

## ALGORITHM ##
# 1. iterate through the input array
# 2. access each element and multiply by 2
# 3. modify the element in input array to reflect change
# 4. break once all array elements have been multiplied

def double_numbers!(array)
  counter = 0
  until counter ==  array.size
    array[counter] *= 2
    counter += 1
  end
  array
end