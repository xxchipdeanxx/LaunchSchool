#Write a method that takes a year as input and returns the century. 
#The return value should be a string that begins with the century number, 
#and ends with st, nd, rd, or th as appropriate for that number.

#New centuries begin in years that end with 01. 
#So, the years 1901-2000 comprise the 20th century.

#Problem
#Write a mehtod that takes an integer and returns the correct century

#Rules
#Input - integer
#output - string

#Output should have the correct suffix attached
  # st --> 1
  # nd --> 2
  # rd --> 3
  # th --> rest

#Data - Array?

#Algo
# determine what century the integer would fall within
  # century = year / 100
  # if century % 100 == 0 --> considered to be one century less 
# determine what suffix to use
# reutrn the the century and suffix as a string

def century(year)
  century = year / 100 + 1
  century -= 1 if (year % 100 == 0)

  century.to_s + det_suffix(century)
end

def det_suffix(century)
  return 'th' if [11,12,13].include? (century % 100)
  last_digit = century % 10
  case last_digit
  when 1
    'st'
  when 2
    'nd'
  when 3
    'rd'
  else
    'th'
  end
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'