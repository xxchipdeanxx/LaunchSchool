#You have a bank of n switches before to along a hall.
#On your first pass you turn all the lights on.
#On your second pass your toggle switches 2,4,6...
#On your third pass you toggle switches 3,6,9...

#You repeat until you have walked n times down the hall.

#Write a method that takes one argument, the total number of switches, 
#and returns an Array that identifies which lights are on after n repetitions.

#Rules
#Input - n --> number switches/passes down the hall
#Output - an array containing only the lights that are on

#Every light is on after the first pass
# Every subsequent pass turns off the switch at n and then the next light
# n spaces away from n
  # 2, 4, 6, 8...
  # 3,6,9,12...
  # 4,8,12,16..
  # 5,10,15,20...

#Data - Array

#Algo
#create an array to represent every light being on
# from from n to the end of the hall --> light_array.size
    # 2..5 --> from switch #2 to switch #5
    # current switch index = n - 1
    #light_array[current_index] *= -1
    #current_index += n
    #break if current_index >= array.size

  # switch n and every switch n switches away down the hall
# partition the final array to find only the lights that are still on
# return the array where lights are on

#create an array with all lights on
  # create an empty lights array = []
  # from (0..n) append the array with an ON value (1)

require 'pry'
require 'pry-byebug'

def gen_lights(number_of_lights)
  light_array = []
  (1..number_of_lights).each {|n| light_array << 1}
  light_array
end

def flip_switch(light_array, nth_light)
  switch_index = nth_light - 1
  until switch_index >= light_array.size
    light_array[switch_index] *= -1
    switch_index += nth_light
  end
  light_array
end

def lights_on(number_of_lights)
  light_array = gen_lights(number_of_lights)
  (2..number_of_lights).each do |nth_light|
    flip_switch(light_array, nth_light)
  end

  lights_on = []
  light_array.each_with_index do |status, index|
    lights_on << (index +  1) if status == 1
  end
  lights_on
end


p lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

#Examples
# n = 5
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

#The result is that 2 lights are left on, lights 1 and 4. 
#The return value is [1, 4]

#n = 10
# round 1: every light is on
# round 2: lights 2,4,6,8,10 are off; 1,3,5,7,9 are on
# round 3: lights 2,3,4,8,9,10 are off; 1,6,5,7
# round 4: lights 2,3,9,10 are off ; 1,4,5,6,7,8 are on
# round 5: lights 2,3,5,9 are off; 1,4,6,7,8,10
# round 6: lights 2,3,5,6,9 are off; 1,4,7,8,10
# round 7: lights 2,3,5,6,7,9 are off; 1,4,8,10
# round 8: lights 2,3,5,6,7,8,9 are off; 1,4,10 are on
# round 9: lights 2,3,5,6,7,8 are off; 1,4,9,10 are on
# round 10:lights 2,3,4,5,6,7,8,10 are off; 1,4,9 are on
#--------------------------------------------------------


#With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
#The return value is [1, 4, 9]
