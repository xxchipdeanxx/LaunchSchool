class Robot
  @@used_names = []
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  attr_accessor :name

  def initialize
    loop do
      generate_name
      break unless @@used_names.include?(@name)
    end
    @@used_names << name
  end

  def reset
    @@used_names.delete(@name)
    self.name = generate_name
  end

  private

  def generate_name
    @name = ''
    @name += LETTERS.shuffle.take(2).join + NUMBERS.shuffle.take(3).join
  end
end
