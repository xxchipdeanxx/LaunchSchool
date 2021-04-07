
#Write a method that does the same thing as Range#step, but does not 
#operate on a range. Instead, your method should take 3 arguments: 
#the starting value, the ending value, and the step value to be applied to 
#each iteration. Your method should also take a block to which it will 
#yield (or call) successive iteration values.

#Note that Range#step will not reach past it's range if the next
#number is beyond the bounds of the range
  #(1..5).step(5) {|num| p num}
    # 1
    #=> (1..5)
  #The #step method will not access a nil value (1 + 5) == 6 which is beyond the range

#Normal Range#step methods return the origional range. What should our custom
#step method return?

def step(start, limit, step)
  start_num = start
  end_num = limit
  step_amount = step
  while start_num <= end_num
    yield(start_num)
    start_num += step_amount
  end
  (start..limit).step(step)
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

##Expected output#
# value = 1
# value = 4
# value = 7
# value = 10
