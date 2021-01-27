#Write a program that will ask a user for an input of a word or multiple words 
#and give back the number of characters. 
#Spaces should NOT be counted as a character.

#Rules 
#Input - string --> can have multiple words including spaces and punct.
#Output - The origional string plus a char count in a specific format

#Spaces do NOT count as character
#Punct. does count
# Final string has a format There are x chars in "/string/"

#Data - Array

#Algo
# get a string from the user
#break up string into 'word' --> ommit any spaces
# initilize char_count = 0
# iterate through the word_array --> count the chars for each word
# add the char count of each word to total char_count
# format final string for output

def char_count
  print "Please write word or multiple words: "
  input_string = gets.chomp
  word_arr = input_string.split(" ")
  char_count = 0
  word_arr.each {|word| char_count += word.size}

  puts "==> There are #{char_count} characters in \"#{input_string}\"."
end

char_count



#Examples
# Please write word or multiple words: walk
# ==> There are 4 characters in "walk".

# Please write word or multiple words: walk, don't run
# ==> There are 13 characters in "walk, don't run".