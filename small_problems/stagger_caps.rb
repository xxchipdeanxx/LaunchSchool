#Write a method that takes a String as an argument, and returns a new String 
#that contains the original value using a staggered capitalization scheme in 
#which every other character is capitalized, and the remaining characters are 
#lowercase. Characters that are not letters should not be changed, but count 
#as characters when switching between upper and lowercase.

#Problem
#start with a string of all lower case letter and capitalize every other
#char in the string. Non letter chars should remain unchanged but count
#towards the alternating pattern
  # spaces and punct.

#Rules
#input - string
#output - NEW string --> stagger capped

#non letters do not change case but count to alternating pattern
#first index of string is always capped

#Data - Array

#Algo
#downcase the entire string --> blank slate
#iterate from 0 to string size --> non inclusice
# if index is even --> cap
# return string

# def staggered_case(string)
#   chars = string.downcase.chars
#   chars.each_with_index do |char, index|
#     char.upcase! if index.even?
#   end
#   chars.join
# end

# def staggered_case(string)
#   string = string.downcase
#   (0...string.size).each do |index|
#     string[index] = string[index].upcase if index.even?
#   end
#   string
# end

def staggered_case(string,first_char)
  result = ''
  need_upper = first_char == 'up' ? true : false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', 'up') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'down') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', 'down') #== 'IgNoRe 77 ThE 444 NuMbErS'