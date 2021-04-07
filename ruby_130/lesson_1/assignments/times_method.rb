#using the information we now have learned about invoking blocks from
# within a method -- see if we can create a method that will give us the
# SAME behavior and return value as Integer#times

#Example code
# 5.times do |num|
#   puts num
# end

#Example output
#0
#1
#2
#3
#4

#=> 5 

#Since we don't have a calling object like Integer#times -->
#our method will be invoked in the following way

#times(5) -- output and return should be indentical to the Integer#times method

def times(input_num)
  block_input = 0
  until block_input > (input_num - 1)
    yield(block_input) if block_given?
    block_input += 1
  end
  input_num
end

times(5) do |num|
  puts num
end
