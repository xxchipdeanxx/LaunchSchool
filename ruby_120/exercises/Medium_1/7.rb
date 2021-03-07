#Refactor the code to take in a custom high and low number
#Also give the user a fighting, variable number of guesses based on
  #the size of the range
  #Math log2(size_of_range).to_i + 1


require 'pry'   

class GuessingGame
  attr_reader :random_number, :remaining_guesses, :range
 
  def initialize(low, high)
    @range = (low..high)
    @random_num = rand(range)
    @remaining_guesses = generate_guesses(range)
    @guess = nil
  end

  def play
    loop do 
      break if @guess == @random_num || @remaining_guesses < 1
      display_guesses_left
      get_guess
      evaluate_guess
      decrease_guesses if @guess != @random_num
    end
    display_final_results
  end

  private

  def generate_guesses(range)
    Math.log2(range.size).to_i + 1
  end

  def evaluate_guess
    puts "Your gues is too high" if @guess > @random_num
    puts 'Your guess is too low' if @guess <  @random_num
  end

  def decrease_guesses
    @remaining_guesses -= 1
  end

  def display_guesses_left
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def get_guess
    input = nil
    loop do
      puts "Enter a number between #{range.first} and #{range.last}:"
      input = gets.chomp.to_i
      break if range.cover?(input)
      puts 'Invalid guess.'
    end
    @guess = input
  end

  def display_final_results
    result = @remaining_guesses >= 1 ? "You won!" : "You have no more guesses. You lost!"
    puts result
  end

end

game = GuessingGame.new(501, 1500)
game.play
