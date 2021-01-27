#Write a method that determines the mean (average) of the three scores passed 
#to it, and returns the letter value associated with that grade.

#Numerical Score Letter 	Grade
# 90 <= score <= 100 	'A'
# 80 <= score < 90 	'B'
# 70 <= score < 80 	'C'
# 60 <= score < 70 	'D'
# 0 <= score < 60 	'F'

#Tested values are all between 0 and 100. 
#There is no need to check for negative values or values greater than 100.

#Rules
#input - 3 integer scores
#output - a char representing the letter grade

#final grade based on average score

#scores will always be from 0-100
# only will be 3 scores passed

#upcase char

#Data - Hash

#Algo
#calculate the average score for all three tests --> float
# compate the score against the hash values
# return the appropriate key once the score is found

GRADES = {
  "A": (90..100),
  "B": (80..89),
  "C": (70..79),
  "D": (60..69),
  "F": (0..59)
}

def get_grade(scr1, scr2, scr3)
  final_score = (scr1 + scr2 + scr3) / 3
  GRADES.each do |k,v|
    return k.to_s if v.include?(final_score)
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"