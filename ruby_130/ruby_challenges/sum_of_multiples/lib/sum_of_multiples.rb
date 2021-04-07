class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(num)
    SumOfMultiples.new(*[3,5]).to(num)
  end

  def to(num)
    total = []
    (@multiples.min...num).each do |number|
      total << number if @multiples.any? {|multiple| (number % multiple).zero?}
    end
    total.sum
  end
end