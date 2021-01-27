#Write a method that takes an Array of Integers between 0 and 19, and returns 
#an Array of those Integers sorted based on the English words for each number:

#zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
#twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

#Problem
#convert an integer value to its string representation
# sort the array based on the string version of the numbers

#Rules
# Intgers from 0..19 inclusive --> max

#Input - An array of integers
#Ouput - An array of integers --> sorted via the string size

# ascending order (a<=>b)

#Data - Array Hash

#Algo
#create a hash that can map the integer number to its string value
# sort_by the string values --> not the size
#return

NUM_WORDS = %w(zero one two three four five six seven eight nine ten eleven 
twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  p array.sort_by {|num| NUM_WORDS[num]}
end



p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]