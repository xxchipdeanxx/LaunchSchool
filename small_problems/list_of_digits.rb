#Write a method that takes one argument, a positive integer, 
#and returns a list of the digits in the number.

#Rules
#Input - a single integer
#Output - an array of digits that create the input num

#Only one argument

#Data - Array

#Algo
#extract all digits from input num
#store each digit into an array
#reuturn the array

def digit_list(input_num)
  digit_ary = input_num.to_s.chars
  digit_ary.map! {|element| element.to_i}
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true