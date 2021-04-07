#Given the code:
#Fill out the following method calls for gather so that they produce the corresponding 
#output shown in numbers 1-4 listed below:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1#
# gather(items) do |*vegeies ,grain|
#   puts vegeies.join(', ')
#   puts grain
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

#2#
# gather(items) do | fruit, *vegies, grain |
#   puts fruit
#   puts vegies.join(', ')
#   puts grain
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3#
# gather(items) do | fruit, *others |
#   puts fruit
#   puts others.join(', ')
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

#4#
# gather(items) do | apple,corn ,cabbage ,wheat |
#   puts "#{apple},#{corn},#{cabbage},#{wheat}"
# end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!