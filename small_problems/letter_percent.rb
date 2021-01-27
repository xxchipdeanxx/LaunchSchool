#Write a method that takes a string, and then returns a hash that contains 3 
#entries: one represents the percentage of characters in the string that are 
#lowercase letters, one the percentage of characters that are uppercase letters, 
#and one the percentage of characters that are neither.

#Problem
#break a string down into chars and produce a hash that reports
#the percentage of the total string each type of char comprises
  # uppercase
  #lowercase
  #neither

#Rules
#input -string
#output - hash

#Assume the string will always contain at least one char
#spaces count as a char
#percentage of total num of chars

#Data - Hash, Array

#Algo
#create an letters hash
#break the string into chars
#iterate through the char array
  # if the char is a lower case --> populate lowercase
# repeat for other two conditions
# update the values in hash to represent precentages
# map through hash
  # value = (hash[key] / chars.size.to_f) * 100

# def letter_percentages(string)
#   letters = {
#     lowercase: 0,
#     uppercase: 0,
#     neither: 0
#   }
#   chars = string.chars

#   chars.each do |char|
#     if /[a-z]/.match(char)
#       letters[:lowercase] += 1
#     elsif /[A-Z]/.match(char)
#       letters[:uppercase] += 1
#     else
#       letters[:neither] += 1
#     end
#   end
#   letters.map do |key, value|
#     letters[key] = (value / chars.size.to_f) * 100
#   end
#   letters
# end

def calc_percent(string,regexp)
  (string.scan(regexp).size / string.size.to_f) * 100
end

def letter_percentages(string)
  letters = {
    lowercase: calc_percent(string, /[a-z]/).round(2),
    uppercase: calc_percent(string, /[A-Z]/).round(2),
    neither: calc_percent(string,  /[[:^alpha:]]/).round(2)
  }
  letters
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}