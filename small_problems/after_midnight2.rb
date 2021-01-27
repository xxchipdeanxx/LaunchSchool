#Write two methods that each take a time of day in 24 hour format, and 
#return the number of minutes before and after midnight, respectively. 
#Both methods should return a value in the range 0..1439.


#Problem
#write two methods that take a string representation of
# the 24 hour clock and returns the num of min before
# or after midnight

#Rules
# two seperate methods
# both methods should reuturn a num (0..1439)
  # no negatives

#input - string --> 24 hour clock format
#output - integer

#Data - 

#Algo
# establish constants
#calculate the number of hours into minuets
# add this number to the number of min

#before

#after

MIN_PER_HOUR = 60
HOURS_PER_DAY = 24
MIN_PER_DAY = HOURS_PER_DAY * MIN_PER_HOUR

def after_midnight(string)
  hours, min = string.split(":").map(&:to_i)
  (hours * MIN_PER_HOUR + min) % MIN_PER_DAY
end

def before_midnight(string)
  hours, mins = string.split(":").map(&:to_i)
  total_min =  mins + hours_to_min(hours)

  remaining_min = MIN_PER_DAY - total_min
  remaining_min = 0 if remaining_min == MIN_PER_DAY
  remaining_min
end

def hours_to_min(hours)
  hours * MIN_PER_HOUR
end






p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0

