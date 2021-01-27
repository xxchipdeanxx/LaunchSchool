#Write a method that takes a first name, a space, and a last name passed as a 
#single String argument, and returns a string that contains the last name, 
#a comma, a space, and the first name.

#Problem
#given a name; swap the last name first, add a comma, and then add the last name

#Rules
#input - string
#output- string --> rearranged

#name will always be seperated by a space

#Data - Array

#Algo
#break the name up into words
#interpolate and add a comma

# def swap_name(string)
#   name =  string.split
#   "#{name[1]}, #{name[0]}"
# end

# def swap_name(string)
#   name = string.split.reverse
#   name.first << ','
#   name.join(' ')
# end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'