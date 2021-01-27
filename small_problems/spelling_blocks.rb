#A collection of spelling blocks has two letters per block, as shown in this list:

#This limits the words you can spell with the blocks to just those words that do not use both 
#letters from any given block. Each block can only be used once.

#Write a method that returns true if the word passed in as an argument can be 
#spelled from this set of blocks, false otherwise.

#Problem
#given a word -- determine if the word can be formed from using our
#blocks

#Rules
#input - string
#output -  bool

# blocks should work regardless of case

# A block can only be used once in the creation of a word
  # can't have a word that uses BOTH letters on a block

#Data - Array
# need a container that will map two String to eachother --> regardless of case
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

#Algo
#format incoming string to downcase
# generate a two dimensional array with our block faces
# break the string into chars
# iterate through each char in the string and delete the char from block array
# if -- at the end -- any of the sub arrays for the block are empty
# it means both letters on a block were used --> return false
# else return --> true

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  blocks = [['b','o'],['x','k'],['d','q'],['c','p'],['n','a'],
            ['g','t'],['r','e'],['f','s'],['j','w'],['h','u'],
            ['v','i'],['l','y'],['z','m']]
  
  letters = word.downcase.chars
  letters.each do |char|
    blocks.each do |block|
      block.delete(char)
    end
  end
  blocks.none? {|block| block.empty?}
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
