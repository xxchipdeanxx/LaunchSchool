#Write a method that can rotate the last n digits of a number.
# Note how n = 1 simply returns the oigional integer
# Assume that n will ALWAYS be a postive integer

#Rules
#Input - An integer and 'n' --> the digit we want to send to the end
#Output -  the shifted integer

#Always positive integer for n
  # n denotes the digit position we wish to send to the end
  # counts from right to left x...1
#The integer will always be positive

#Data - Array

#Algo
# break the integer into its component digits
# based on n --> remove that digit from the array and add to the end of the array
  # index = array.size - n
  # slice!
# join the array and convert the string into an integer

def rotate_rightmost_digits(integer, n)
  digit_array = integer.to_s.chars
  index_to_shift = (digit_array.size - n)
  digit_array << digit_array.slice!(index_to_shift)

  digit_array.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
