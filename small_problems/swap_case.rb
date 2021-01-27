#Write a method that takes a string as an argument and returns a new string in 
#which every uppercase letter is replaced by its lowercase version, and every 
#lowercase letter by its uppercase version. All other characters should be 
#unchanged.

#You may not use String#swapcase; write your own version of this method.

#Problem
#given a string, swap the cases of all alphabetical chars
# non alphabetical chars remain unchanged

#Rules
#input - string
#output -  NEW string

#can NOT use String#swapcase
# all non-alphabetical chars remain unchanged

#Data - Array

#Algo
# break the string into indivi. chars
# iterate through each char
  # if the char upcased equals the char --> it's capitalized
    # must be downcased
  # else
    # upcase the char
  # join the array to retun a new string

require 'pry'

# def swapcase(string)
#   words = string.chars.each do |char|
#     char.upcase == char ? char.downcase! : char.upcase!
#   end
#   words.join
# end

def swapcase(string)
  chars = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  chars.join
end


# binding.pry
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'