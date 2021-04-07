require 'time'

class Anagram
  def initialize(string)
    @word = string
  end

  def match(word_array)
    result = []
    chars_to_match = @word.chars.map(&:downcase)
    word_array.each do |word|
      next unless word.size == chars_to_match.size && @word.downcase != word.downcase
      result << word if word.chars.all? {|char| chars_to_match.count(char.downcase) == word.count(char)}
    end
    result
  end

end

result = nil
detector = Anagram.new('allergy')

loop do
  start = Time.now
  detector.match %w( gallery ballerina regally clergy largely leading)
  result = (Time.now - start)
  break
end

p result
