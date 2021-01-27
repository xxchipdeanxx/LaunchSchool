#A double number is a number with an even number of digits whose left-side 
#digits are exactly the same as its right-side digits. For example, 44, 3333, 
#103103, 7676 are all double numbers. 444, 334433, and 107 are not.

#Write a method that returns 2 times the number provided as an argument, 
#unless the argument is a double number; double numbers should be returned as-is.

#Problem
#write a number that returns 2 times an input number unless is is a double num
# in that case simply return the number

#Rules
#input - integer
#output - integer --> depending on if the input is a double num

#double num
  #even number of digits AND left side digits are same as right side digits

#if double num --> return num
# if not --> double the number and return

#Data - Array

#Algo
#determine if a number is a double number
  # break into str chars and check to see if first half matches second hald
# if it is double --> return num
# if it is not double num --> return num * 2

def double_num?(num)
  num_str = num.to_s
  sample_size = num_str.size / 2
  num.size.even? && num_str[0,sample_size] * 2 == num_str
end

def twice(num)
  double_num?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10