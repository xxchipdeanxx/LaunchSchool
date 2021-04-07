#Write a method called drop_while that behaves similarly for Arrays. 
#It should take an Array as an argument, and a block. 
#It should return all the elements of the Array, except those elements at the 
#beginning of the Array that produce a truthy value when passed to the block.

#If the Array is empty, or if the block returns a truthy value for every 
#element, drop_while should return an empty Array.

def drop_while(array)
  first_falsy_index = nil
  array.each_with_index do |element, index|
    next if yield(element)
    first_falsy_index = index
    break
  end
  !!(first_falsy_index) ? array[first_falsy_index..-1] : []
end

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

#The second solution works with line 29 because we were taking our index one number beyond
#the number of indexes that hold an object.
  #By the end of the while loop the index will be 4
  #Thus when we slice our array argument --> array[4..-1] we are returned an empty array []
  #It is interesting to note that if our index variable was 5
  # array[5..-1] would return nil and thus line 29 would evaluate as false

#So- why is is that we are able to slice from the size of the
#container to the last element (index -1) and get an empty array, but going any more beyond that and we get
# nil as a return?

#Turns out this is by design. It is the way the Array#slice method has been implemented in Ruby
  #"...an empty array is returned when the starting index for an element range is at the end of the array."
  #By 'end' of the array they mean in a value that is equal to the array#size
    #array[4..-1] #=> []
    #array[4..-100] #=> []
    #array[4..100] #=> []
  #It doesn't matter how large of a slice we have. If the staring index is the 'end'
  #of the array --> we will ALWAYS get an empty array as a return value

#The second #drop_while method implementation takes advantage of this behavior
#by allowing index to be incremented just to the point where it will eventually
#equal the array#size by the condition (index < array.size)