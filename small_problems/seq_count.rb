#Create a method that takes two integers as arguments. 
#The first argument is a count, and the second is the first number of a 
#sequence that your method will create. The method should return an Array 
#that contains the same number of elements as the count argument, while the 
#values of each element will be multiples of the starting number.

#You may assume that the count argument will always have a value of 0 or 
#greater, while the starting number can be any integer value. 
#If the count is 0, an empty list should be returned.


#Problem
#given two numbers; the first a count number, the second a sequence starter
#generate multiples of the second starter from 1 to the count

#Rules
#input - two integers --> count and seq counter
#output - array with count num of elements and the multiples of our second num

#the size of the final arr. will always be == to count
# count will always be 0 or more
# seq can be negative

# a count of 0 should return an empty array

#Data - Array

#Algo
# create a return array
# iterate from 1 to count
# push the number times our second num into the array
# return the final array


def sequence(count, seq)
  final_array = []
  (1..count).each do |num|
    final_array << num * seq
  end
  final_array
end

def sequence(count, seq)
  (1..count).to_a.map {|num| num * seq}
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []