#Write a method called each_with_object that behaves similarly for Arrays. 
#It should take an Array and an object of some sort as an argument, and a block. 
#It should yield each element and the object to the block. 
#each_with_object should return the final value of the object.

#If the Array is empty, each_with_object should return the original object 
#passed as its second argument.

def each_with_object(collection, new_obj)
  collection.each {|element| yield(element, new_obj)}
  new_obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

#Since all the methods implemented in the blocks are destructive
#When we pass the container into #each_with_object as an argument, and then pass it again into 
#pass it again into the block via yield --> we are referencing the exact same 
#object during the entire execution of the method

#It may not seem like it at first, but when we type [] or {}
# We are technically instantiating a new Array or Hash object respectivly.
#Thus, whenever we invoke #each_with_object -- we are instantiating a new
# instance of a container class and passing it directly into the method as an
#argument

#Normally we would not be able to do much with a call like [] or {}
# in regular code since we have given no variable to reference this new, empty container
#But since we assign the container a local variable named 'new_obj' upon invocation of 
# of #each_with_object --> we can now reference the object within the method and
#use it a more explicit sense. This includes allowing us to even pass the container
#object into the block via yield

