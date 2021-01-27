#Write a method that counts the number of occurrences of 
#each element in a given array.

#The words in the array are case-sensitive: 'suv' != 'SUV'. 
# Once counted, print each element alongside the number 
# of occurrences.

#Example
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

#Problem
#Create a method that counts the occurances of a word.
#It should output a formatted string 'word => frequency'

#Rules
#Input - an array of strings
#Output - a formatted string "Word => num_occurances"

#words are case-sensative. unless all chars are (==) --> considered
# a different word. \
  # Must be reported/counted seperate

# Data - Array, Hash

#Algo
# Create an empty hash = {}
#Iterate through the incoming array
  # key --> word
  # value --> frequencey
# if the hash has no key for the word yet
  # create the key and assign a feqeuncy at 1
# if the key does exist --> word has been encontered before
  # add one to the number of occurences
    # hsh[word] += 1
#Iterate through the hsh
# puts "key => value"


def count_occurrences(input_array)
  word_hsh = {}
  local_array = []
  input_array.each {|word| local_array << word.dup.downcase}

  local_array.each do |word|
    word_hsh[word] += 1 if word_hsh.key?(word)
    word_hsh[word] = 1
  end

  word_hsh.each { |word, freq| puts " #{word} => #{freq}" }

end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

