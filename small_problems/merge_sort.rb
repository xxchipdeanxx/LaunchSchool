#Sort an array of passed in values using merge sort. 
#You can assume that this array may contain only one type of data. 
#And that data may be either all numbers or all strings.

#Merge sort is a recursive sorting algorithm that works by breaking down the 
#array elements into nested sub-arrays, then recombining those nested 
#sub-arrays in sorted order. It is best shown by example. 

#For instance, let's merge sort the array [9,5,7,1]. 
#Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

#We then work our way back to a flat array by merging each pair of nested 
#sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

#Problem
#given a single dimension array, create a recursive function that
#break each element down to an individual object stored in an array
#and then merges and sorts each sub array until we get a single
#dimension array that is all sorted

#Rules
#input - single dimension array
#output - single dimension array --> sorted

#must use a recursive method to break down and merge and sort
  # can not simply sort the incoming array

#inputs can vary, but will never mix types on an input
  # either all String or all Integer
# string is sorted using the basic <=> operator --> first char only
#integer is sorted as expexted --> ascending numerical order

#arrays are not necessairly even in number --> splittig
#by 'pairs' can be tricky

#method is recursive --> it will need a condition to end
  # breaks down elements into nested sub arrays
  # builds and sorts in pairs
  #combines and repeats until the array is one dimensional

#Data - Array

#Algo
#create helper method to break down the array into
# a series of nested arrays each containing one element
# call the recursive function
  # (find stop condiiton)
  # combine the array pairs and sort
  #repeat
# reutrn the single dimension array --> should be sorted in ascending order
  # regardless of object type in the array

#because recursive --> only take it one step of the way each time

#merge_sort
#duplicate the array
#break down into sub arrays
  # until duplicate array size is one
    # recursivly call the sub_array generator
#once duplicate array cant be broken down any further
# until the duplicate array size matches the input array size
  # recursivly call the sort and merge method
#return the final, sorted duplicate array

#gen sub_array
#seperate the elements by half and store in an array element
#sample size is based on number of elements in the array
#


require 'pry'

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(array)
  return array if array.size == 1
  sample_size = array.size / 2
  sub1 = array[0...sample_size]
  sub2 = array[(sample_size)...array.size]
  sub1 = merge_sort(sub1)
  sub2 = merge_sort(sub2)

  return merge(sub1, sub2)
end


# gen_sub_arrays([6, 2, 7, 1, 4])

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

#We then work our way back to a flat array by merging each pair of nested 
#sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]