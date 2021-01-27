#Write a method which takes a grocery list (array) of fruits with 
#quantities and converts it into an array of the correct number of each fruit.

#Rules
#input - nested array with two elements each --> fruit and count
#output - single array with all fruts represented for each count

#Data - Array

#Aglo
#iterage over the nested array to modify the format
#multiply the string by the count
# flatten the final nested array

# def buy_fruit(fruit_array)
#   final_array = []
#   groceries = fruit_array.map do |fruit, count|
#     count.times do final_array << fruit
#     end
#   end
#   final_array
# end

def buy_fruit(fruit_array)
  fruit_array.each_with_object([]) do |fruit, count, obj|
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

