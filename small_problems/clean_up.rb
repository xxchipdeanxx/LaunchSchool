#Given a string that consists of some words (all lowercased) and an 
#assortment of non-alphabetic characters, write a method that returns that 
#string with all of the non-alphabetic characters replaced by spaces. 
#If one or more non-alphabetic characters occur in a row, you should only 
#have one space in the result (the result should never have consecutive spaces).

#Problem
#replace any non letter with a space

#Rules
# can't have two spaces back to back
  # if two non alphabet chars occur back to back

  #inputs - string
  #output - string --> sans non alphabets

#punction counts as a char that needs a space

#Data - Array

#Algo
# remove excess spaces
# split into 'words'
# iterate throgh each word and pad a space when necessary
#det. what's a letter and what's not
# substitute any non letter char for a " "

def cleanup(string)
  words = string.split 
  
end

def space_pad(word)
  
end



p cleanup("---what's my +*& line?") == ' what s my line '