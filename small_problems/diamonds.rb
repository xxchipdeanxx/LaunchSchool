#Write a method that displays a 4-pointed diamond in an n x n grid, 
#where n is an odd integer that is supplied as an argument to the method. 
#You may assume that the argument will always be an odd integer.

#Rules
#Input - odd integer
#Output - series of strings to produce a diamond

#Input will always be odd integer
#diamon has nxn pattern
  # n columns down
  # n stars long at its MAX length
# star length goes from
  # 1..3..5..7..9.. until it reaches 'half' the row length
  # then it counts down 9..7..5..3..1
  # we add two more stars than the previous line --> middle
  # we subtract two stars from the previos line --> end

# the star shares a center line
  # maybe used by adding spaces
  # tabs need to be based on 'n' to make sure there is room
  # MIDDLE row has only one space --> always
  # TOP row has (x) spaces --> the number of rows to get to the middle
      # each row after has one less the then last

# How to represent row and column numbers?
  # 0 index OR 1 index
    # 0 is easier to find the "middle" of the diamond

#Data - 
# n = number of total rows
# max_stars = n
# max_spaces = middle_row + 1
# start_row = 0
# middle_row = ((n-1) / 2)

#how to store or represent the diamond?
  #string loop that begins at (start_row...middle_row) and prints
  # " " * max_spaces + (row + 1)* "*"

require 'pry'  

def print_diamond_top(middle_row_index, n)
  start_row_index = 0
  max_spaces = middle_row_index + 1
  num_stars = 1

  until num_stars > n
    (start_row_index..middle_row_index).each do |row_num|
      puts "#{" " * max_spaces + "*" * (num_stars)}"
      max_spaces -= 1
      num_stars += 2
    end
  end
end

def print_diamond_bottom(middle_row_index, n)
  max_stars = n - 2
  max_spaces = middle_row_index + 1
  num_spaces = 2
  start_row_index = middle_row_index + 1

  (start_row_index..n).each do |row_num|
    puts "#{" " *  num_spaces + "*" * max_stars}"
    num_spaces += 1
    max_stars -= 2
    break if max_stars < 1
  end
end

def diamond(n)
  middle_row_index = (n - 1) / 2 # used to 0 index the diamond
  print_diamond_top(middle_row_index, n)
  print_diamond_bottom(middle_row_index, n) if n > 1
end


diamond(9)
diamond(5)
diamond(3)
diamond(1)



# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *