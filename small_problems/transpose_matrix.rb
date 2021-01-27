#Write a method that takes a 3 x 3 matrix in Array of Arrays format and 
#returns the transpose of the original matrix. Do not modify the origional
#array.

#Rules
#input - nested array
#output - NEW nested array with the array elements transposed

#Array will always be a 3x3 matrix. 3 array with 3 elements each

#Data - Array

#Algo
#load all first elements into a leading array
#load the second elemetns into an array
#load the final elements into an array
#nest and return all thee arrays

  # 0,0
  # 1,0
  # 2,0
  # 1,1
  # 2,1
  # 3,1


  require 'pry'

# def transpose(nested_array)
#   leading = []
#   second = []
#   third = []
#   nested_array.each do |sub_array|
#     leading << sub_array[0]
#     second << sub_array[1]
#     third << sub_array[2]
#   end
#   [leading,second,third]
# end

def transpose!(nested_array)
  final = []
  (0..2).each do |row_index|
    final << nested_array.map {|sub_array| sub_array[row_index]}
  end
  final
end





#Example
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


p transpose!(matrix) == [
  [1, 4, 3],
  [5, 7, 9],
  [8, 2, 6]
]