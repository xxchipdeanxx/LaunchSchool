#Problem
# write a method that takes in a floating point number and ouputs
# the string representation of that angle.
# method should fit a specific output format
  # degree symbol
  # min. symbol
  # sec. symbol

#Rules
#input - float
#output - string in spec. format

#measures 0-360 degrees
#final degrees are rounded

#degree = 60min
#min = 60sec

#Data -

#Algo
#assign everything to left of decimal to the degrees
#use decimal as a percentage of degrees --> min.round
#us any remaining decimal as a percentage of min --> sec.round
#enter the variable into a formatted string
  #pad with 0's if digis are not long enough to fill field
# reuturn the string





DEGREE = "\xC2\xB0"
MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEGREE = MIN_PER_DEG * SEC_PER_MIN

def dms(float)
  total_seconds = float * SEC_PER_DEGREE
  total_min, remaining_seconds = total_seconds.divmod(SEC_PER_MIN)
  degrees, remaining_min = total_min.divmod(MIN_PER_DEG)
end


p SEC_PER_DEGREE
p 76.73 * SEC_PER_DEGREE

  #dms(30) == %(30°00'00")
  # dms(76.73) == %(76°43'48")
  # dms(254.6) == %(254°36'00")
  #dms(93.034773) == %(93°02'05")
  # dms(0) == %(0°00'00")
  # dms(360) == %(360°00'00") || dms(360) == %(0°00'00")