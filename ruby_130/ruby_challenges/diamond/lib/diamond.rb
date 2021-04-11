require 'time'

class Diamond
  def initialize(char)
    @lines = []
    @chars = ('A'..char).to_a
    @height = @chars.size > 1 ? ((@chars[0..-2].size * 2) + 1) : 1
    @width = @height
  end

  def self.make_diamond(char)
    Diamond.new(char).make_diamond
  end

  def make_diamond
    return "A\n" if @chars.size == 1
    create_top
    create_bottom
    @lines.join
  end

  private

  def create_top
    @chars.each_with_index do |char, index|
      if index == 0
        @lines << single_character_line
      else
        @lines << double_character_line(char,index)
      end
    end
  end

  def single_character_line
    outter_space = (@width - 1) / 2
    "#{' ' * outter_space}A#{' ' * outter_space}\n"
  end

  def double_character_line(char,index)
    outter_space = (@chars.index(@chars[-1]) - index)
    inner_space = @width - (outter_space*2) - 2
    "#{' ' * outter_space}#{char}#{' ' * inner_space}#{char}#{' ' * outter_space}\n"
  end

  def create_bottom
    last_lines = @lines[0..-2].reverse
    last_lines.each {|line| @lines << line}
  end
end

class DiamondLS
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return "A" if letter == 'A'
    return "B B" if letter == 'B'

    letter + determine_spaces(letter) + letter
  end

  def self.determine_spaces(letter)
    all_letters = ['B']
    spaces = 1

    until all_letters.include?(letter)
      current_letter = all_letters.last
      all_letters << current_letter.next
      spaces += 2
    end

    ' ' * spaces
  end

  def self.max_width(letter)
    return 1 if letter == 'A'

    determine_spaces(letter).count(' ') + 2
  end
end

result1 = nil
result2 = nil

while result2.nil?
  start1 = Time.now
  DiamondLS.make_diamond('E')
  result1 = (Time.now - start1)

  start2 = Time.now
  Diamond.make_diamond('E')
  result2 = (Time.now - start2)
end

puts "LS method: #{result1}"
puts "My method: #{result2}"

