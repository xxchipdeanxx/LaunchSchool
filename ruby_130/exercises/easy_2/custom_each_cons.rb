#Write a method called each_cons that behaves similarly for Arrays, taking the 
#elements 2 at a time. The method should take an Array as an argument, 
#and a block. It should yield each consecutive pair of elements to the block, 
#and return nil.

#determine how/when to stop sampling to not access nil
  #(size - 1) is the max number of times you can safy slice

def each_cons(array)
  iteration = 1
  index = 0
  while iteration < array.size
    yield(array[index,2])
    iteration += 1
    index += 1
  end
    nil
  end

#We can reduce the amount of local variables we need to track if we
#delegate iteration to an existing Ruby, core method. The second portion of this
#problem helps demonstrate why the bottom implementation is prefered and MUCH
#easier to implemnt

# def each_cons(array)
#   array.each_with_index do |item, index|
#     break if index + 1 >= array.size
#     yield(item, array[index + 1])
#   end
#   nil
# end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil