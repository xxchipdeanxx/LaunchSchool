class Octal
  def initialize(oct_string)
    @octal = oct_string
  end

  def to_decimal
    return 0 unless /\A[0-7]+\z/.match(@octal)

    total = 0
    digits = @octal.to_i.digits
    digits.each_with_index do |digit, index|
      total += digit * (8**index)
    end
    total
  end
end

result1 = nil
result2 = nil
loop do
  start1 = Time.now
  Octal.new('1234567').to_decimal
  result1 = (Time.now - start1)

  start2 = Time.now
  Octal.new('1234567').to_decimal
  result2 = (Time.now - start2)
  break
end

p result1
p result2
