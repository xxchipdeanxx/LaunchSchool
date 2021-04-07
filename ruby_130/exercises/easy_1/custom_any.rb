#create a method that behaves just like Array#any?
  ##implementation should stop once the first true is found
  ## return false even if the array agument is empty
  ## can NOT use all?, any?, none?, or one?.

def any?(collection)
  collection.each do |element|
    return true if yield(element)
  end
  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false

#This example will never imlement the block array.each inside #any? since it has
# no elements to access. The block will simply return the empty array [] and continue
# execution to the final return statement
p any?([]) { |value| true } == false

