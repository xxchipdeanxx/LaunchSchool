#Problem
#Create a madlib program and reads in a formatted text file and randomly
#selects the correct words from a list created in the program to plug into
#the template text provided. The output should be a complete madlib

#Rules
# words to plug in should be randomly selected each time the program is run
#to provide variation

#input - a template .txt file
#output - a madlib with all the proper words plugged in

#Data - Hash? Array?
# A hash with symbols that point to an array storing a choice of words
# each time the hash is initilized --> the values stored at the symbols
# are random

#Algo
# open and read in the file into a string
# break the string into words
#iterate through each word
# if the 'word' is actually a symbol
# search the string for our symbol flags
  # substitute the string representation of the flag
  # with the hash value for the proper type of word
    # string.gsub!(:noun, hsh[:noun].sample)
# return the final string

require 'pry'

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze


File.open('madlib_temp.txt') do |file|
  file.each do |line|
    p line
    puts format(line, noun:       NOUNS.sample,
                      verb:       VERBS.sample,
                      adverb:    ADVERBS.sample,
                      adjective:  ADJECTIVES.sample)
                
  end
end



#Example output
# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

#Example text data
# The :adjective brown :noun} :adverb
# :verb the :adjective yellow
# :noun, who :adverb :verb his
# :noun and looks around.