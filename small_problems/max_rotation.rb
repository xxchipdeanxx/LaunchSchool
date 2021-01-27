#Generate the max rotation number from an origional integer input
# 735291 --> 321579
  # keep first 0 digits in place --> shift first digit to the right --> 352917
  # keep fitst 1 digits in plaace --> shift next digit right --> 329175
  # keep first 2 digits in place --> shift next --> 321759
  # keep first 3 digits in place --> shift right --> 321597
  # keep first 4 digits in place --> shift right --> 321579

# number of shifts is the number of digits minus 1
  # the last shift would be a redundant one as the last digit would shift with itself

#Rules
#Input - integer
#Output - the max rotation number generated

#Do not have to worry about repeating 0's
# leading 0's will be dropped when converte to integers again
# consider different integer notaiton 8_703_529_146

#Data - Array

#Algo
#break integer into its component digits
#establish number of shifts --> # of digits - 1
# establish a 'keep' variable = 0 --> array[0,keep] --> will be empty on firs iteraiton
#iterate through our array
# secure what is 'kept'
# rotate the next digit to the end of the array
# save the state of the array
# join the array and convert to integer
# return the integer









max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845