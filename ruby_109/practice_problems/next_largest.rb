# Create a mehtod that takes a positive integer and returns
# the NEXT, bigger (in numerical sequence) number formed by the same
# digits.

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no number can be composed using those digits ==> -1

#Problem
#Find the NEXT largest number that can be formed by rearranging
#the digits of the origional number
#IF no next number exists --> reutrn -1

#Rules
#all inputs are integers
#single digit num --> -1
  # 9
#numbers with the same digit -->
  # 111

#Inut - a single Integer
#Output - the next largest integer OR -1 

#Data - Array, Integer

#Algo
#get each digit as a self contained unit 
  # ['2','0','1','7']
#sort the digits into ascending order [0,1,2,7]
# iterate from the input number to the largest possible number
  #(num..gen_max(num))
# return num if new_num.sort == num_array && new_num > num
# if no match return -1

def next_bigger_number(input_number)
  input_digits = gen_digits(input_number)
  (input_number..gen_max(input_number)).each do |new_number|
    numbers_generated += 1
    return new_number if gen_digits(new_number) == input_digits && new_number > input_number
  end
  -1
end

def gen_digits(number)
  number.to_s.chars.sort {|a,b| b <=> a}
end

def gen_max(number)
  gen_digits(number).join.to_i
end


 
p next_bigger_number(9) == -1
p next_bigger_number(12) == 21
p next_bigger_number(513) == 531
p next_bigger_number(2017) == 2071
p next_bigger_number(111) == -1
p next_bigger_number(531) == -1
p next_bigger_number(123456789) == 123456798
p next_bigger_number(2071) == 2107
p next_bigger_number(576) == 657
p next_bigger_number(10) == -1
p next_bigger_number(893) == 938






