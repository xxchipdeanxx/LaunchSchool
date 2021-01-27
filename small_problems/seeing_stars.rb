#Write a method that displays an 8-pointed star in an nxn grid, 
#where n is an odd integer that is supplied as an argument to the method. 
#The smallest such star you need to handle is a 7x7 grid.

#Rules
#input - an odd integer number
#output - string that looks like a 8-pointed star

#never have to deal with a smaller number than 7 as input



#Data - 

#Algo
#create two seperate methods
  # one to print the row
  # one to act as the main calling method
    # will determine how many times the print statements should be called

def print_row(grid_size,distance_from_center)
  space = ' ' * (distance_from_center - 1)
  row = Array.new(3,'*').join(space)
  puts row.center(grid_size)
end


def star(grid_size)
  max_distance = (grid_size / 2)
  max_distance.downto(1) do |distance|
    print_row(grid_size, distance)
  end
  puts "*" * grid_size
  1.upto(max_distance) do |distance|
    print_row(grid_size, distance)
  end
end

def clear_screen
  system('cls') || system('clear')
end

def boom(max_distance)
  bloom = []
  max_distance.downto(7) {|num| bloom << num if num.odd?}
  bloom.sort.each do |size|
    star(size)
    clear_screen
  end
end


boom(25)

# star(7)


# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# star(25)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *