#Write a method called one? that behaves similarly for Arrays. 
#It should take an Array as an argument, and a block. 
#It should return true if the block returns true for exactly one of the 
#element values. Otherwise, it should return false.

#IF an array is empty the method should return false
#Execution should end immediatly after the second occurence of true is found

#Only true if the block yields true for only ONE element

#Initialize a bool flag to false
#Iterate through the container
# 

def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false