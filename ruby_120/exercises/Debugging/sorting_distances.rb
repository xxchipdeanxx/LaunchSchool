#When attempting to sort an array of various lengths, we are surprised to see 
#that an ArgumentError is raised. Make the necessary changes to our code so 
#that the various lengths can be properly sorted and line 62 produces the 
#expected output.

class Length
  # include Comparable
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end


  def <=>(other)
    case unit
    when :km  then value <=> other.as_kilometers.value
    when :mi  then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end

  # def <(other)
  #   case unit
  #   when :km  then value < other.as_kilometers.value
  #   when :mi  then value < other.as_miles.value
  #   when :nmi then value < other.as_nautical_miles.value
  #   end
  # end

  # def <=(other)
  #   self < other || self == other
  # end

  # def >(other)
  #   !(self <= other)
  # end

  # def >=(other)
  #   self > other || self == other
  # end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

#The biggest thing to remember is that Array#sort utilizes the comparison method
# <=> which must be properly defined within our custom classes in order for 
# #sort to be able to be implemented properly.

#There is also the choice to include the Comparable module which will -- once
#Length#<=> is properly defined -- automatically 'give' us the following methods
  #(< <=, ==, ==!, =>, >) leading to a cleaner interface

#In absence of using the Comparable module, our specific implementation still works
# even if we ommit our own comparison method definitions but this is because we
# are implementing the comparison method for Integer and Float classes WITHIN our own
#comparison method -- both of which are well defined, core methods

#But - if we were ever to compare our own custom classes -- we would then need to
# provide definitions for each comparison method in order to give context as to HOW
# the objects should be compared

