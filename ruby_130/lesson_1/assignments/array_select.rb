# wrtie a custom method that behaves just like Array#select
# remember that Array#select iterates through an array
# and will return a new array containing ONLY the elements for which 
# the block evaluates as true

def select(array)
  final_array = []
  index = 0
  while index < array.size
    current_element =  array[index]
    final_array << current_element if !!(yield(current_element)) == true
    index += 1
  end
  final_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| nil }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

array = 'This is a TEST to see how many Test characters that can be put to the tEsT'.split
p select(array) {|word| word.match(/test/i)}.size == 3