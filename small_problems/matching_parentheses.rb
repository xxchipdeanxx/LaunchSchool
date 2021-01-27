#Write a method that takes a string as argument, and returns true if all 
#parentheses in the string are properly balanced, false otherwise. 
#To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

#Problem
#given a string; return true or false depending on if the parentheses are 
#balanced

#Rules
#input - string
#output - bool

#pars. must be alternating to be considered balanced
  # can't simply have the same number
# balanced pairs START with '(' --> NOT ')'

#a str with no parentheses is 'balanced' --> true

#Data - Array

#Algo
#scan the string for parentheses


# def balanced?(string)
#   parentheses = []
#   open_count = 0
#   closed_count = 0
#   string.chars.each do |char|
#     if /\(/.match(char)
#       parentheses << char
#       open_count += 1
#     elsif
#       /\)/.match(char)
#       parentheses << char
#       closed_count += 1
#     end
#   end

#   parentheses.join #== "#{'(' * closed_count}#{')' * open_count}"
# end

require 'pry'

def balanced?(string,pair)
  parens = 0
  string.chars.each do |char|
    parens += 1 if char == pair[0]
    parens -= 1 if char == pair[1]
    break if parens < 0
  end
  parens.zero?
end

p balanced?('What (is) this?',"()") == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false