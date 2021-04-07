#write a method that takes an array as an argument. 
#The method should yield the contents of the array to a block, 
#which should assign your block variables in such a way that it ignores the 
#first two elements, and groups all remaining elements as a raptors array.

birds = %w(raven finch hawk eagle)

def categorize(birds_array)
  yield(birds_array) if block_given?
end

categorize(birds) {|_arg1_, _arg2_, *raptors| puts "Raptors: #{raptors.join(',')}"}


%w(raven finch hawk eagle)