#Write a method named include? that takes an Array and a search value as 
#arguments. This method should return true if the search value is in the array, 
#false if it is not. 

#You may not use the Array#include? method in your solution.

#Problem
#given an array and a search value; return true if the value is present
# and false if not

#Rules
#input - array and a search object
#output - true or false

# can NOT use Array#include?

# method should accom. any object
# be aware of empty arrays and nil --> watch return values

#Data - Array

#Algo
#iterate through the array
# return true if element == input obj
# exit loop
# return false otherwise

# def include?(array, srch)
#   array.each {|element| return true if element == srch}
#   false
# end

def include?(array, value)
  !!array.find_index(value)
end



p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false