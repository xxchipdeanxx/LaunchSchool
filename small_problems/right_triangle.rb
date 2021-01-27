#Write a method that takes a positive integer, n, as an argument, and 
#displays a right triangle whose sides each have n stars.

#Rules
#input - a integer --> max base
#output - a right triangle made of stars

# triangle should face left

#Data -

#Algo
#estab. the max number of spaces needed
  # max_spaces = interger input
  # print the number of spaces and the num of starts for a row


def triangle_1(num)
  1.upto(num) do |num|
    puts "#{'*' * num}"
  end
end

def triangle_2(num)
  spaces = 1
  num.downto(1) do |num|
    puts "#{' ' * spaces}#{'*' * num}"
    spaces += 1
  end
end

def triangle_3(num)
  num.downto(1) do |num|
    puts "#{'*' * num}"
  end
end

def triangle_4(num)
  max_spaces = num
  (1..num).each do |num|
    puts "#{' ' * max_spaces}#{'*' * num}"
    max_spaces -= 1
  end
end

def triangle(num, quad)
  case quad
  when 1
    triangle_1(num)
  when 2
    triangle_2(num)
  when 3
    triangle_3(num)
  when 4
    triangle_4(num)
  end
end


triangle(5,1)
puts "\n"
triangle(9,2)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********