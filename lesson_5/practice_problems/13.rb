#Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.
#Return a NEW array
#Must contain all origional elements
#Sub arrays must be sorted logically based on the odd numbers they contain

## EXPECTED OUTPUT ##
#[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort do |array_1, array_2|
  array_1[2] <=> array_2[2]
end

## OR ##

arr.sort_by do |sub_arry|
  sub_arry.select do |num|
    num.odd?
  end
end


