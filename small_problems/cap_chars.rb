#Write a method that takes a single String argument and returns a new string 
#that contains the original value of the argument with the first character of 
#every word capitalized and all other letters lowercase.

#You may assume that words are any sequence of non-blank characters.

#Rules
#input - string
#output - NEW string object but with each letter of each word capped

#Data - Array

#Algo
#downcase the initial string
# break string up into words
#iterate through the array and upcase each word
# join the array --> with a space
#return

require 'pry'

# def word_cap(string)      # able to use String#capitalize
#   words = string.split
#   words.map(&:capitalize).join(' ')
# end

# def word_cap(string)      # can't use string cap. v_1
#   words = string.downcase.split
#   words.map! do |word|
#     word[0] = word[0].upcase
#     word
#   end
#   words.join(' ')
# end

CAP_LETTERS = ('A'..'Z').to_a
LOW_LETTERS = ('a'..'z').to_a

def word_cap(string)
  words = string.downcase.split
  words.each do |word|
    word [0] = CAP_LETTERS[(LOW_LETTERS.index(word[0]))] if !!LOW_LETTERS.index(word[0])
  end 
  words.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
# binding.pry
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'