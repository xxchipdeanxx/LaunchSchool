#Modify the method from the previous exercise so it ignores non-alphabetic 
#characters when determining whether it should uppercase or lowercase each 
#letter. 

#The non-alphabetic characters should still be included in the return 
#value; they just don't count when toggling the desired case.

#Data - Array

#Algo
#create a toggle --> since we can't use index
#break down the string into characters
#iterate through the string
#if the char matches an alphabetical char
  # if toggle is true --> upcase
  # if toggle is false --> downcase
#else return the character
# swap the value of toggle
#join the array to return a NEW string
require 'pry'

def staggered_case(string, non_letters)
  chars = string.downcase.chars
  match_exp = non_letters ?  /./ : /[a-z]/i
  up_case = true
  chars.each do |char|
    if char.match(match_exp)
      up_case ? char.upcase! : char.downcase!
      up_case = !up_case
    end
  end
  chars.join
end

# binding.pry
p staggered_case('I Love Launch School!', true) == "I LoVe lAuNcH ScHoOl!"
p staggered_case('ALL CAPS', true) == 'AlL CaPs'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'