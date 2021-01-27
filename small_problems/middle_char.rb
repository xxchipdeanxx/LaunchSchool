#Write a method that takes a non-empty string argument, and returns the middle 
#character or characters of the argument. If the argument has an odd length, 
#you should return exactly one character. 

#If the argument has an even length, you should return exactly two characters.

#Problem
# return the middle char(s) of a string

#Rules
#input - string
# output - either one or two chars

#if str lengh is even --> return two chars
#if str length is odd --> return on char

#if even --> end char is at str size / 2
#start char is one index less than the size / 2

#Data -  Array

#Algo
# determine the string size
  # if even --> extract two center chars
  # if odd --> extract center most char
# return the extracted char(s)

def center_of(string)
  start_index = string.size / 2
  if string.size.odd?
    string[start_index]
  else
    string[(start_index - 1 ),2]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'