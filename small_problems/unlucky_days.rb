#Write a method that returns the number of Friday the 13ths in the year given 
#by an argument. You may assume that the year is greater than 1752 
#(when the United Kingdom adopted the modern Gregorian Calendar) and that 
#it will remain in use for the foreseeable future.

#Problem
#given the year; output how many instances of Friday the 13th there are
#in that given year

#Rules
#input -integer --> year
#output - integer --> occurences of Friday 13 in the given year

#We are using the gregorian calendar scheme

#Data -

#Algo
#create a date object with the given year
#

require 'Date'

# def friday_13th(year)
#   date = Date.new(year)
#   count = 0
#   until date.year == (year+1)
#    count += 1 if date.day == 13 && date.friday?
#    date = date.next
#   end
#   count
# end

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year,1,13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2