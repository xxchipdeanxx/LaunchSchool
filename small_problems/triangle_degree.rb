#Write a method that takes the 3 angles of a triangle as arguments, and 
#returns a symbol :right, :acute, :obtuse, or :invalid depending on whether 
#the triangle is a right, acute, obtuse, or invalid triangle.

#To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
#and all angles must be greater than 0: if either of these conditions is not 
#satisfied, the triangle is invalid.


# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.

#Rules
#input - integer --> 3 angles
#output - a symbol cat. the triangle

#Assume all angles will be integer numbers

def valid_triangle?(angle_arr)
  angle_arr.sum == 180 && angle_arr.none? {|angle| angle == 0}
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  if valid_triangle?(angles)
    return :acute if angles.all? {|angle| angle < 90}
    return :right if angles.any? {|angle| angle == 90}
    return :obtuse if angles.any? {|angle| angle > 90}
  else
    :invalid
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
