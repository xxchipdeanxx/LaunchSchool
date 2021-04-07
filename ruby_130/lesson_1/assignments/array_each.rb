#create a custome method that behaves in the same way as the core Array#each
# method. Meaning that it iterates trough and array and passes elements into
# a block as an argument and eventually returns the origional array

def each(array)
  index = 0
  while index < array.size
    yield(array[index]) if block_given?
    index += 1
  end
  array
end

array = [1,2,3]
each(array) {|num| puts num}