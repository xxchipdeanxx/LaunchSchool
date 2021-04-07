require 'time'

class Scrabble
  attr_reader :word

  LETTER_VALUES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p 3),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z),
}.freeze

  def initialize(input)
    @word = input
    @score = 0
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return @score unless /\A[a-zA-Z]+\z/.match(@word)
    LETTER_VALUES.each do |value, letters|
      @word.downcase.chars.each do |char|
        @score += value if letters.include?(char)
      end
    end
    @score
  end
end

# class Scrabble
#   attr_reader :word

#   POINTS = {
#     'AEIOULNRST'=> 1,
#     'DG' => 2,
#     'BCMP' => 3,
#     'FHVWY' => 4,
#     'K' => 5,
#     'JX' => 8,
#     'QZ' => 10
# }
#   def initialize(word)
#     @word = word ? word : ''
#   end

#   def score
#     letters = word.upcase.gsub(/[^A-Z]/, '').chars

#     total = 0
#     letters.each do |letter|
#       POINTS.each do |all_letters, point|
#         total += point if all_letters.include?(letter)
#       end
#     end
#     total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end


result = nil
obj = Scrabble.new('quirky')
loop do
  start = Time.now
  obj.score
  result = (Time.now - start)
  break
end
p result