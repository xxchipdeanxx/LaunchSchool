#Write a method that will take a short line of text, and print it within a box.
#You may assume that the input will always fit in your terminal window.

#Rules
#input - string
#output -  formatted string

#text won't run over to the next line

# space above text
#     text
# space below text

#(1) space on either side of the text

# Dashes: size of text
# + on either side
# blank1 " " * size of text + 2
# blank2 " " * size of text + 2

#Algo
# create strint interp statements based on string size


def print_in_box(string)
  length = string.size

  puts "+#{'-' * (length + 2)}+"
  puts "| #{' ' * length} |"
  puts "| #{string} |"
  puts "| #{' ' * length} |"
  puts "+#{'-' * (length + 2)}+"
end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+



print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+