#Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

#=> a = 2, b = [3,8]

#When arr is first created, it stores a reference to a. It is the same object
# But when we use the ASSIGNMENT operator on line 7.
# We REREFERENCE the value in arr to no longer point to a
#THUS a is unaffected by the increment (+2)

#b was affected because when we call arr[1][0]...
# we are actually interacting with the array that b is holding

#It essentially boils down to WHAT object is held at each index of arr
#Since arr[0] holds an Integer type
  #- the += call acts as a REREFERENCE method within integer class
  #THUS a remains unaffected by line 7
#Alternativly, since arr[1] holds an Array class
  #- The act of calling arr[1][0] tell Ruby that we want to access...
  #   the array stored by b directly
  #   calling an array index and using assignment is DESTRUCTUVE in Array class
  #   Thus line 8 actually modifies b