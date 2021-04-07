require 'time'

# class RomanNumeral
#   NUMERALS = {
#     0 => { 0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX'}, #ones place
#     1 => { 0 => '', 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 5 => 'L', 6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC'}, #tens place
#     2 => { 0 => '', 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 5 => 'D', 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM'}, #hundreds place
#     3 => { 1 => 'M', 2 => 'MM', 3 => 'MMM'} #thousands place
#   }

#   def initialize(num)
#     @number = num
#   end

#   def to_roman
#     digits = @number.digits
#     string = ''
#     digits.each_with_index do |num, index|
#       string.prepend(NUMERALS[index][num])
#     end
#     string
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

result = nil
time_result = nil
number = RomanNumeral.new(3000)
loop do
  time_start = Time.now
  result = number.to_roman
  time_result = (Time.now - time_start)
  break
end
p result
p time_result
