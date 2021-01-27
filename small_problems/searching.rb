#Write a program that solicits 6 numbers from the user, then prints 
#a message that describes whether or not the 6th number appears amongst 
#the first 5 numbers.

#Rules
#Input - 6 integer numbers
#Output - string based on if the last number was previously used

#Rules
# all inputs will be integer
# 6th number is not added to the array for comparison/display
# Format --> "Enter the (1st, 2nd, 3rd...)"
# Final string has two output options --> yes or no
  # includes the array containing previously used numbers

#Data - Array

#Algo
# gets (6) integers from the user
    # brtue froce --> line, by line
    # loop?
# load the first 5 inputs into an array
# check to see if the 6th number is included in the array
# output the correct string --> yes / no


def searching
  num_array = []
  final_num = nil
  (1..5).each do |number|
    suffix = gen_suffix(number)
    puts "==> Enter the #{number}#{suffix} number:"
    num_array << gets.chomp.to_i
  end

  puts "==> Enter the last number:"
  final_num = gets.chomp.to_i

  if num_array.include?(final_num)
    puts "The number #{final_num} appears in #{num_array}."
  else
    puts "The number #{final_num} does not appear in #{num_array}."
  end
end

def gen_suffix(number)
  case number
  when 1
    'st'
  when 2
    'nd'
  when 3
    'rd'
  else 'th'
  end
end

searching


#Examples
#==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].