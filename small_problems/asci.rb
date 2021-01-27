#Write a method that determines and returns the ASCII string value of a 
#string that is passed in as an argument.

# The ASCII string value is the sum of the ASCII values of every character 
#in the string. (You may use String#ord to determine the ASCII value of a 
#character.)

#Problem
#Find the total acsii num of the string

#Rules
#input - string
#output - integer number

#can use .ord to determine the acsi value of each char
# the ascii for the string is the sum of all individual char values

#Data -Array

#Algo
# break the string into indiv chars
# calc the ascii value for each individual char
# add the value to a runnig total -- sum the final array
# return num

def ascii_value(string)
  string.bytes.sum
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0