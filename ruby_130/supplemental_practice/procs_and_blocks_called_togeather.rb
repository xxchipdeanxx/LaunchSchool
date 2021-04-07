def each(array, proc_arg = nil)
  index = 0
  while index <  array.size
    proc_arg.call(array[index]) if !!(proc_arg)
    yield(array[index]) if block_given?
    index += 1
  end
  array
end

array = [1,2,3,4]
chunk = Proc.new {|num| puts num + 1}

p each(array)
puts
p each(array) {|num| puts num}
puts
p each(array, chunk) {|num| puts num}
