#Write a method that takes a string with one or more space separated words 
#and returns a hash that shows the number of words of different sizes.

#Words consist of any string of characters that do not include a space.

#Problem
# return a hash that contrains a count of how many words of a length are in a string

#Rules
# punct is considred and commas --> 'word'
# hsh {num of letters => number of words that match}

#Input - string
#Output - hash

#Data - Array Hash

#Algo
# create an empty hash
# break down the string into 'words'
# iterate through and create key/value pairs when neccesary --> based on word size
  # or simply increment
# return the hash

#Part 2
#Modify the word_sizes method from the previous exercise to exclude non-letters 
#when determining word size. For instance, the length of "it's" is 3, not 4.




def word_sizes(string)
  hsh = Hash.new(0)
  words = string.split
  words.each do |word|
    hsh[char_count(word)] += 1
  end
  hsh
end

def char_count(word)
  word.count "A-z"
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}





#FROM PART ONE
# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}