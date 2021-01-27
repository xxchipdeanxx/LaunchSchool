#Write a method that takes an Array of numbers, and returns an Array 
#with the same number of elements, and each element has the running total 
#from the original Array.

#Problem
#Write a method that takes an array and reutrns an array of the same size
# but each element is the sum all other integers in the array --> running total

#Rules
# array should have the same number of elements
#Input - array
#Output -  array of same size but with a running total reported

#Data - Array

#Algo
# create a running total array
# map through the exiting array
# push the element into the running total array and sum
# wha is return will be loaded into the origional array
# return the running total array 

# def running_total(array)
#   running_total = []
#   array.map do |num|
#     running_total << num
#     running_total.sum
#   end
# end

require 'pry'

def running_total(array)
  test = array.each_with_object([]) do |num, arry|
    if arry.empty?
      arry << num
    else
      arry << (num + arry.last)
    end
  end
end





p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []