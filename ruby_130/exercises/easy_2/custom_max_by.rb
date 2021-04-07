#Write a method called max_by that behaves similarly for Arrays. 
#It should take an Array and a block, and return the element that contains 
#the largest value.

#If the Array is empty, max_by should return nil.


def max_by(array)
  return nil if array.empty?
  max_index = 0
  current_max = yield(array[max_index])
  array.each_with_index do |element, index|
      new_value = yield(element)
      if new_value > current_max
        max_index = index
        current_max = new_value
      end
  end
  array[max_index]
end



# def max_by(array)
#   return nil if array.empty?
#   results = []
#   array.each {|element| results << yield(element)}
#   max_value = results.max
#   max_index = results.index(max_value)
#   array[max_index]
# end

##Does not count because #max is iterative by design --> we're limited to our iterative methods


# def max_by(array)
#   return nil if array.empty?
#   max_element = array.first
#   curr_largest = yield(max_element)
#   array[1..-1].each do |element|
#     new_value = yield(element)
#     if new_value > curr_largest
#       curr_largest = new_value
#       max_element = element
#     end
#   end
#   max_element
# end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil