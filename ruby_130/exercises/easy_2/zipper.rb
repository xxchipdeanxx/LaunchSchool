#Write your own version of zip that does the same type of operation. 
#It should take two Arrays as arguments, and return a new Array 
#(the original Arrays should not be changed). 
#Do not use the built-in Array#zip method.

#You may assume that both input arrays have the same number of elements.

def zip(array1, array2)
  result_array = []
  (0...array1.size).each do |index|
    result_array << [array1[index], array2[index]]
  end
  result_array
end

def zip(array1, array2)
  array1.each_with_index.with_object([]) do |(element,index), result|
    result << [element, array2[index]]
  end
end

#I don't love this first solution. I feel as if there is a better way to
#refactor this code

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]