#create a custome method that will work in the same way as Enumerator#reduce
#our method should take an array argument FOR SURE, but also allow the 
#user to be able to include an additional argument that will act as the
#accumulator value

#Remember -- the way Enumerator#reduce works is that it introduces the
#accumulator value into a block each time -- inplements the blocks code, and
#sets the accumulator to the RETURN value of the block

#From there the method will eventually return the final accumulator value

# def reduce(array, start_val = 0)
#   accumulator = start_val
#   index = 0
#   while index < array.size
#     current_element = array[index]
#     accumulator = yield(accumulator,current_element) if block_given?
#     index += 1
#   end
#   accumulator
# end

# #Test cases
# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

#The final example will fail once the Integer 2 is passed into the block as
# the num argument
  # num.odd? (2.odd?) will evaluate as false meaning that (acc + num) will never
  # be implemented -- thus the block will simply return nil
#Since we have set (on line 17) for the local variable ```accumulator```to reference the return
#value once the block is evaluated --> accumulator references nil after 2 is passed to the block
#This will cause a NoMethodError upon the next invocation of the block
  #since (3.odd?) evaluates as true --> Ruby will attempt to implement (nil + 3)
  #and since we know that nil has no instance methods Nil#+ -->  we will get the no method error

#It is possible to mask this error assuming all the elements in the array after 1 were even numbers
#(acc + num) would NEVER be evaluated since no element of the arryay could sastify (num.odd?) -->
#leading to (nil + num) from ever being implemented

#Improved default value determination
def reduce(array, start_val = array[0])
  accumulator = start_val
  index = 1
  while index < array.size
    current_element = array[index]
    accumulator = yield(accumulator,current_element) if block_given?
    index += 1
  end
  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']