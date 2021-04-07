class Triangle
  attr_reader :sides
  def initialize(side1,side2,side3)
    raise ArgumentError unless is_it_a_triangle?(side1,side2,side3)
    @sides = [side1,side2,side3]
  end

  def kind
    if all_sides_equal?
      'equilateral'
    elsif only_two_sides_equal?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def all_sides_equal?
    (sides.sum / 3.0) == sides[0]
  end

  def only_two_sides_equal?
    sides = @sides.sort
    middle_side = sides[1] #sorts sides in ascending order. The middle side should be equal to one of the others if triangle is isosceles
    sides[0] == middle_side || sides[-1] == middle_side
  end
  
  def is_it_a_triangle?(*sides)
    result = sides.all? {|side| side > 0} &&
             sum_of_sides(sides)
  end

  def sum_of_sides(sides)
    result = sides[0..1].sum > sides[-1] &&
             sides[1..-1].sum > sides[0] &&
             sides[-1] + sides[0] > sides[1]
    result  
  end
end


