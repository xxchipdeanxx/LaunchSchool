#Write a method that takes a string, and returns a new string in which every 
#character is doubled.

#Rules
#input - string
#output- string where every char is doubled

#spaces and punct are counted as well

#Data - Array

#Algo
#break down the string into characters
#iterate through each char multiply by two
#join the array back togeather
#return the string

# def repeater(string)
#   chars = string.chars
#   chars.map! {|char| char * 2}
#   chars.join
# end

def repeater(string)
  string.gsub(/./) {|char| char * 2}
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''