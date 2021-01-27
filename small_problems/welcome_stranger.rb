#Create a method that takes 2 arguments, an array and a hash. 
#The array will contain 2 or more elements that, when combined with adjoining 
#spaces, will produce a person's name. The hash will contain two keys, 
#:title and :occupation, and the appropriate values. 
#Your method should return a greeting that uses the person's full name, and 
#mentions the person's title and occupation.

#Problem
#print a welcome statement with the contents of a given array and hash

#Rules
#input - Array and Hash
#output - a single string statement

#name will always be seperated by a space for each element
# include full name, title and occupation

#Data - Array Hash

#Algo
#join the incoming arry
#create a print statment
#access the values in hash 
#print string

def greetings(name, status)
  name = name.join(' ')
  job = status.values.join(' ')
  puts "Hello, #{name}! Nice to have a #{job} around."
end



greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.