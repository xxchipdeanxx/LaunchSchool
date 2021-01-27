#Problem
# given a number of minuets (+/-) report what time it would be on a 
# 24 hr clock

#Rules
# negative numbers means before mightnight
# positive numbers means aftermidnight
#input - integer -- min before or after midnight
#output - string represening a 24 hr clock

# can be DAYS and mins beyond midnight

#Data - Array

#Algo
# if the input is less than a day (1440)
# divmod give num of hours and min past/beyond midight

# any larger than 1440 and you are a full days away

require 'pry'

MIN_PER_HOUR = 60
HOURS_PER_DAY = 24
MIN_PER_DAY = HOURS_PER_DAY * MIN_PER_HOUR

def time_of_day(delta_min)
  delta_min = delta_min % MIN_PER_DAY
  hour, min = delta_min.divmod(MIN_PER_HOUR)
  p format('%02d:%02d', hour, min)
end




time_of_day(0) == "00:00" # --> midnight / newday
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(686)
# time_of_day(-1437) == "00:03" #--> a full 24 hours previously
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29" # --> many days previously 