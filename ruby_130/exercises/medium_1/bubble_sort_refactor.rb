#Refactor the bubble sort method so that it can take a block (if provided)
#so that the user can define some specific sorting critiera at the time of
#method invocation

#currently this method is destructive. Meaning that it modifies the contents
#of the array passed as an argumen in place. This is why we also have a return of nil
#at the end

#Out of the box #bubble_sort! will sort the elements is ASCENDING order

#Bubble sort will keep looping through the array, looking at two elements at a time
#and continue to sort until a condition is met where each index in secuence is
#less than the element to it's right. 

#One this condition is met, the loop will break and the method will return an nil value

#The refactored version should be able to operate on a block that will return
# a boolean value
  # a true prompts a stay
  # a false prompts a swap

##FURTHER EXPLORATION##
#Modify your solution so it only passes one element to the block at a time; 
#the block should perform some sort of transformation to the argument, and 
#bubble_sort! itself should just use <= to compare two values. 

#In other words, you should be able to call #bubble_sort! like this:

  def bubble_sort!(array)
    local_array = array.map {|element| yield(element)}
    loop do
      swapped = false
      1.upto(local_array.size - 1) do |index|
        next if local_array[index - 1] <= local_array[index]
        local_array[index - 1], local_array[index] = local_array[index], local_array[index - 1]
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end
        break unless swapped
    end
    nil
  end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

##Origional Problem##
#   def bubble_sort!(array)
#     loop do
#       swapped = false
#       1.upto(array.size - 1) do |index|
#         if block_given?
#           next if yield(array[index - 1], array[index])
#         else
#           next if array[index - 1] <= array[index]
#         end

#         array[index - 1], array[index] = array[index], array[index - 1]
#         swapped = true
#       end
#       break unless swapped
#     end
#     nil
#   end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)