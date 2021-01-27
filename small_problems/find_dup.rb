#Given an unordered array and the information that exactly one value in the 
#array occurs twice (every other value occurs exactly once), how would you 
#determine which value occurs twice? Write a method that will find and return 
#the duplicate value that is known to be in the array.

#Problem
#find the dup. value in an unordered array set

#Rules
#input - array of integers
#output - integer --> the value of the duplicated element

#exactly one value is repeated
#only an array of integer values

#Data - Array

#Algo
#sort the array in ascending order
#iterate through the array
#if the element == the next element --> return the element

require 'pry'

def find_dup(array)
  array.sort!.each_with_index do |num, index|
    return num if num == array[index+1]
  end
end








p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73