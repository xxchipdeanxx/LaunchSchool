#Your job is to write a function which increments a string, 
#to create a new string.

#If the string already ends with a number, 
#the number should be incremented by 1.

#If the string does not end with a number. 
#the number 1 should be appended to the new string.

#Examples
# foo -> foo1

# foobar23 -> foobar24

# foo0042 -> foo0043

# foo9 -> foo10

# foo099 -> foo100

# "" --> '1'

#Attention: If the number has leading zeros 
#the amount of digits should be considered.

#Problem
#incredment the number trailing a string.
#If the string doesn't end with a number --> append a '1' to it

#Rules
#Input - String -either has a number at the end OR no number
#Output - String. The string incremented by 1

#If the string doesn't have a digit yet --> append a '1' to it
#If an empty string is passed --> append '1' (note string)

#Beaware of how incrementing can affect numbers
  # foo9 -> foo10
    #must add a ditit if necessary
  # foo099 -> foo100
    #The numbers actually increment
  # foo999 -> foo1000
# the number needs to properly increment
# must preserve the number of leading 0's
  # foo0042 -> foo0043 --> 'foo43' is not acceptable
  # foo0099 -> foo0100

#Data - Array, Integer, String

#Observations
# how to observe the leading 0's and still increment properly
  # foo0042 -> foo0043
  # foo099 -> foo100
  # foo999 -> foo1000
#How to treat the trailing digits?
  #Integers?
  #Strings?

#Algo
# slice off the integer portion of the string
  # local_str = input_str.dup
  # local_str.chars
  # ["f", "o", "o", "b", "a", "r", "0", "0", "1"].reverse
  # ["1", "0", "0", "r", "a", "b", "o", "o", "f"]
  # digits = []
  # ["1", "0", "0", "r", "a", "b", "o", "o", "f"].each do |char|
    #break if /\d/.match(char)
    # digits << char
# num_str = digits.empty? ? nil: digits.join 
# if num_str != nil
#   num_str --> '0042'
# final_str = local_str + (num_str.succ)
#else input_str << '1'

def increment_string(input_str)
  local_str = input_str.dup
  num_str = local_str.slice!(/\d+$/)
  
  return local_str += (num_str.succ) unless num_str == nil
  local_str << '1'
end


p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("f00bar") == "f00bar1"
p increment_string("f00b4r") == "f00b4r1"
# p increment_string("foobar001") == "foobar002"
# p increment_string("") == "1"
