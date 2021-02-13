# Given the triangle of consecutive odd numbers:

#1 #1
#2 #3     5
#3 #7     9    11
#4 #13    15    17    19
#5 #21    23    25    27    29
#6 #...

#Calculate the row sums of this triangle 
#from the row index (starting at index 1) e.g.:
#row_sum_odd_numbers(1); # 1
#row_sum_odd_numbers(2); # 3 + 5 = 8

#Given the triangle pattern. Return the number that would result
# From adding all prime numbers in a given row.

#Rules
#Odd numbers are consecutive
#Amount of numbers in each row corresponds to its row number
  # Row 1 --> 1 number
  # Row 2 --> 2 numbers
  # ...
  # Row 19 --> 19 numbers

#Each number is 2 digits away

#Starting row digit is the (current_row_num * (current_row_num - 1)) + 1

#Input - a number that represents the row number to sum
#Ouput - the sum of all the odd numbers in the row

#Data - Range, Array

#Algo

#option 1
#create an empty num_array = []
#set current_num = (row_num * (row_num - 1)) + 1
# append starting_num to num_array
#iterate through a range representing the rest of the digits
  # (2..row_num)
# add two to the current number and append to num_array
  # current_num += 2
#once loop is finished --> sum and return the num_array

#option 2
# set_current_num = (row_num * (row_num - 1)) + 1
# iterate through the rest of the digits in the row
# (2..row).each do
# set current_num += (current_num + 2)
#end the loop and return current_num

#set_current_num = (row_num * (row_num - 1)) + 1
# There is a pattern
  # row**3




def row_sum_odd_numbers(row_num)
  row_num ** 3
end

p row_sum_odd_numbers(1) == 1
p row_sum_odd_numbers(2) == 8
p row_sum_odd_numbers(3) == 27
p row_sum_odd_numbers(4) == 64
p row_sum_odd_numbers(5) == 125
p row_sum_odd_numbers(6) == 216

p row_sum_odd_numbers(13) == 2197
p row_sum_odd_numbers(19) == 6859
p row_sum_odd_numbers(41) == 68921