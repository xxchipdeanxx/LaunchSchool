#Twenty one is a card game in which two players - a dealer and a player draw
# cards from a 52 card deck. Both players initially draw two cards. From there
# each player takes turns and decides to either hit or stay depending
# on the total of their current hand. If either player's total
#goes over 21 -- the other player automatically wins
# thay player with the total that is closest to 21 wins

#Nouns
  #Player
  #Dealer
  #Deck
  #Card
  #Total
  #Value

#Verbs
  #Draw
  #Hit
  #Stay
  #Total

#Organize
  #Player
    #Hit
    #Stay
    #Draw
    #Hand
    #Bust
  #Dealer < Player (with custome logic for when to hit or stay)
  #Deck
    #52 Card elements
  #Card
    #face
    #value
  #Hand
    #total --> as a function of a cards value

#Game
  #play
  #deck

module TerminalControl
  def press_enter
    puts 'Press ENTER to continue'
    loop do
      input = gets.chomp
      break if input.empty?
      puts 'Invalid input'
    end
  end
end

class Player
  def initilize
  end
end

class Dealer
  def initilize
  end
end

class Deck
  def initilize
  end
end

class Card
  def initilize
  end
end

class Game
  include TerminalControl

  def initilize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome_message
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Twenty-One!'
    press_enter
  end

  def display_goodbye_message
    puts 'Thanks for playing!'
    puts "Bye bye"
  end

  display_welcome_message
  generate_deck
  player_draw(2)
  dealer_draw(2)
  dealer.display_hand
  player_turn
  dealer_turn
  determine_winner
  dislay_winner
  display_goodbye
end

game = Game.new
game.play

