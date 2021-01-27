#Write a method that takes an Array, and returns a new Array with the elements 
#of the original list in reverse order. Do not modify the original list.

#You may not use Array#reverse or Array#reverse!, 
#nor may you use the method you wrote in the previous exercise.

#Problem
#take in an array and return a NEW array with the origional elements reversed

#Rules
#input - Array
#output - a NEW array with reversed elements

#must not return the origional container
# can NOT use any Ruby reversing methods
# can NOT use previously written method

#can NOT modify the origional container
  # no pop, shift, delete...etc

#Data - Algo

#Algo
# create an empty array to store elements
# iterate through input array in reverse order
# push the element into the new array
# return the new array

# def reverse(input_array)
#   final_array = []
#   -1.downto((-input_array.size)) do |index|
#     final_array << input_array[index]
#   end
#   final_array
# end

# def reverse(input_array)
#   final_array = []
#   input_array.inject(1) do |mem_, obj|
#     final_array.unshift(obj)
#   end
#   p final_array
# end

def reverse(input_array)
  input_array.each_with_object([]) do |element, array|
    array.unshift(element)
  end
end



p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true