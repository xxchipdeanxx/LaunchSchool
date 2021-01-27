# Your goal in this kata is to implement a difference function, 
# which subtracts one list from another and returns the result.

# It should remove all values from list a, 
# which are present in list b.

# If a value is present in b, 
# all of its occurrences must be removed from the other:

# Examples:
# array_diff([1,2],[1]) == [2]

# Rules:
#Remote ALL occurances from a that occur in b
# If a.empty? --> return []
# If b.empty --> return a

#Neither of the arrays have nested elements

#Input - Two arrays containing integers
#Output - An array containing all elments of a remaining after reduction

#Data - Array

#Algo
#Iterate through array b to look at each element
# If a.include?(element) --> remove it *destructivly
# return a

def array_diff(array1, array2)
  array2.each do |element|
    array1.delete(element)
  end
  array1
end







# Test cases:
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2] 
p array_diff([], [1,2]) == []
