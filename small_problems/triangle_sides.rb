#Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
#and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
#on whether the triangle is equilateral, isosceles, scalene, or invalid.

#To be a valid triangle, the sum of the lengths of the two shortest sides must 
#be greater than the length of the longest side, and all sides must have 
#lengths greater than 0: if either of these conditions is not satisfied, 
#the triangle is invalid.


# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length

#Rules
#input - 3 seperate integer numbers --> triangle side length
#output - symbol --> cat. the triangle or :invalid

#A valid triangle
  # sum of two shortest lengths is greater than the largest
  # all sides must have a length greater than 0

#Data - Array

#Algo
#determine if the three numbers could even form a triangle
  #if any numbers == 0 --> :invalid
  # if the two smallest summed is not greater than the max num :invalid
#if so --> categorize
# if not --> return invalid

def valid_triangle?(sides_ary)
  sides_ary.take(2).sum > sides_ary.last
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if valid_triangle?(sides)
    return :equilateral if sides.all? {|side| side == side1}
    return :isosceles if sides[0] == sides[1] || sides[1] == sides[2]
    return :scalene if sides[0] != sides[1] && sides[1] != sides[2]
  else
    :invalid
  end
end



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid