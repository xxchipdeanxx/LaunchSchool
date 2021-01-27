#Modify your transpose method from the previous exercise so it works with 
#any matrix with at least 1 row and 1 column.





def transpose(nested_array)
  final = []
  (0...nested_array[0].size).each do |row_index|
    final << nested_array.map {|sub_array| sub_array[row_index]}
  end
  final
end





p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]