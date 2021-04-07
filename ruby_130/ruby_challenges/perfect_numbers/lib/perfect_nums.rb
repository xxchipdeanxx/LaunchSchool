require 'time'

class PerfectNumber

  def self.classify(num)
    raise StandardError unless num >= 0
    sum = aliquot_sum(num)
    if sum > num
      'abundant'
    elsif sum < num
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def aliquot_sum(num)
      sum = 1
      counter = 2
      while counter < Math.sqrt(num)
        quotient, result = num.divmod(counter)
        sum += [quotient,counter].sum if result == 0
        counter += 1
      end
      sum
    end
  end
end

class PerfectNumberLS
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end

result1 = nil
result2 = nil

loop do
  start1 = Time.now
  p PerfectNumber.classify(1000000)
  result1 = (Time.now - start1)

  start2 = Time.now
  p PerfectNumberLS.classify(1000000)
  result2 = (Time.now - start2)
  break
end

p result1
p result2

#My implementaiton doesn't really get fater until the number becomes larger than
#around 150

