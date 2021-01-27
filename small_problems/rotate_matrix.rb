#Write a method that takes an arbitrary matrix and rotates it 90 degrees 
#clockwise

#Rules
#input - any arbitrary matrix --> 3 X 3, 3 X 2, 
#output - the matrix rotated 90 degrees clockwise

#arrays are all one, dimensional

#squared matricies do change container size
#non square matricies will resise
  # num of columns becomes the num of rows
  # num of rows becomes the num of columns
# alternates for each 90 degree rotation

#when rotating:
  # all bottom row elements become leading elements for column 1
  # all top row elements become leading elements for last column 

#Algo
# is the proc. different for squared matrix vs non squared?
  # if size and number of elements in each sub array is the same size
  # reverse and map?
#if not squared --> different method
  # depends on numer of elements within the array



#Examples
# matrix = [          
#   [1, 5, 8],        3 4 1
#   [4, 7, 2],  ==>   9 7 5
#   [3, 9, 6]         6 2 8 
# ]  


# 3  4  1           9, 3
# 9  7  5     ==>   7, 4
                  # 5, 1


def rotate90(nest_array)
  final = []
  (0...nest_array[0].size).each do |index_sample|
    final << nest_array.reverse.map {|sub_array| sub_array[index_sample]}
  end
  final
end


def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end

matrix1 = [
[1, 5, 8],
[4, 7, 2],
[3, 9, 6]
]

matrix2 = [
[3, 7, 4, 2],
[5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2