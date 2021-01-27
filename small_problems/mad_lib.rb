#Mad libs are a simple game where you create a story template with blanks for 
#words. You, or another player, then construct a list of words and place them 
#into the story, creating an often silly or funny story as a result.

#Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
#and an adjective and injects those into a story that you create.

#Problem
#create a mad lib that has:
  # a noun
  # a verb
  # an adverb
  # and an adj.

#Rules
#input - non explicitly
#output - string --> mad lib

#Data - 

#Algo
#prompt user to enter
  # noun
  # a verb
  # an adverb
  # an adj

#insert the variables into a final string

def prompt(string)
  puts "Please enter a #{string}"
end


# def madlib
#   prompt('noun')
#   noun = gets.chomp
#   prompt('verb')
#   verb = gets.chomp
#   prompt('adverb')
#   adverb = gets.chomp
#   prompt('adjective')
#   adjective = gets.chomp

#   puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's silly"
# end

def madlib
  words = {}
 %w(noun verb adverb adjective).each do |type|
  prompt(type)
  words[type.to_sym] = gets.chomp
 end
 puts "Do you #{words[:verb]} your #{words[:adjective]} #{words[:noun]} #{words[:adverb]}? That's silly"
end

madlib

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!