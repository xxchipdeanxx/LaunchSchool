# In this little assignment you are given a string of space separated numbers, 
# and have to return the highest and lowest number.

# Examples #
# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"

# Rules #
# high/low values are based on their numerical values
# what to return for empty strings?
# strings are seperated by spaces
# output is within "" --> may need escape sequences

#Input - a string of numbers seperated by paces
#Output - a string with the highest number + space + lowest number
  #- "9 -5" --> not the double quotes

# Data - String
#      - Array

# Algo #
# extract each number from the string
  # - how to handle multi digit numbers
  # - how to handle '-'
  # - how to handle " "

# spaces act as delimeter point
  # signify the end of one number and the beginning of another
# Unpack?




  require 'pry'
  require 'pry-byebug'


def high_and_low(string)
  num_array = string.split.map! {|char| char.to_i }
  "#{num_array.minmax[1]} #{num_array.minmax[0]}"
end

# p high_and_low("1 2 3 4 5") == "5 1"
# p high_and_low("1 2 -3 4 5") == "5 -3"
# p high_and_low("1 9 3 4 -5") == "9 -5"

p high_and_low("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6") == "542 -214"
