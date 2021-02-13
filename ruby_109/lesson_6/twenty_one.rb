require 'pry'
require 'pry-byebug'

TARGET_NUM = 21
DEALER_LIMIT = 17

def new_line
  puts "\n"
end

def clear_screen
  system('clear') || system('cls')
end

def tab_pad(num)
  "\t" * num
end

def input_prompt
  print "\e[5m=>\e[0m"
  gets.chomp.downcase
end

def get_input(acceptable_answers)
  user_input = nil
  loop do
    user_input = input_prompt
    break if acceptable_answers.include?(user_input)
    puts "Please enter a valid selection"
  end
  user_input.downcase
end

def auto_stay
  puts "You have reached \e[1m\e[32m #{TARGET_NUM}"
  puts "#{tab_pad(3)}Automatically opting to STAY\e[0m"
  new_line
end

def auto_win?(total_hsh)
  total_hsh[:player] > TARGET_NUM || total_hsh[:dealer] > TARGET_NUM
end

def hit_or_stay?
  puts "#{tab_pad(3)}Would you like to HIT or STAY"
  puts "#{tab_pad(2)}HIT: 'hit' or 'h'; STAY: 's' or 'stay'"
  answer = get_input(%w(hit h stay s))
  answer.start_with?('h') ? 'hit' : 'stay'
end

def display_move(move, player_str)
  case move
  when 'hit'
    puts "#{tab_pad(3)}#{player_str} has opted to HIT"
  when 'stay'
    puts "#{tab_pad(3)}#{player_str} has opted to STAY"
  end
end

def press_end_to_cont
  puts "Press ENTER to continue"
  get_input("")
end

def bust(player_str)
  "#{tab_pad(3)}\e[1m\e[31m#{player_str} HAS GONE BUST!\e[0m"
end

def generate_cards
  {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    :Jack => 10,
    :Queen => 10,
    :King => 10,
    :Ace => [1, 11] # to be assigned at run time
  }
end

def generate_deck
  {
      hearts: generate_cards,
      diamonds: generate_cards,
      spades: generate_cards,
      clubs: generate_cards
    }
end

def adjust_ace(deck, suit, total_hsh, player_sym)
  if total_hsh[player_sym] + 11 > TARGET_NUM
    deck[suit][:Ace] = 1
  else
    deck[suit][:Ace] = 11
  end
end

def deal_cards(deck, num, total_hsh, player_hand, player_sym)
    num.times do
      random_suit = deck.keys.sample
      random_card = deck[random_suit].keys.sample

      if random_card == :Ace
        adjust_ace(deck, random_suit, total_hsh, player_sym)
      end

      if player_hand.key?(random_suit)
        player_hand[random_suit] << deck[random_suit].slice(random_card)
      else
        player_hand[random_suit] = [deck[random_suit].slice(random_card)]
      end
      deck[random_suit].delete(random_card)
    end
end

def calc_total(total_hsh, player_hand, player_sym)
  total_hsh[player_sym] = 0
  player_hand.each do |suit|
    player_hand[suit[0]].each do |card|
      total_hsh[player_sym] += card.values.sum
    end
  end
end

def display_totals(total_hsh)
  puts "\e[1m\e[32m Your Total\e[0m: #{total_hsh[:player]}"
  puts "\e[1m\e[31m Dealer Total\e[0m: #{total_hsh[:dealer]}"
end

def display_player_hand(player)
  player_hand = player.select { |key| key != :total }

  player_hand.each do |suit, sub_ary|
    sub_ary.each do |face, _|
      puts "#{face.to_a[0].first} of #{suit}"
    end
  end
end

def display_dealer_hand(dealer)
  dealer_hand = dealer.select { |key| key != :total }

  hand_size = 0
  dealer_hand.each do |suit|
    suit[1].each do |_|
      hand_size += 1
    end
  end

  first_card = dealer_hand.first
  suit = first_card[0].to_s
  card = first_card[1][0].keys[0].to_s

  "#{card} of #{suit} and #{hand_size - 1} more"
end

def display_welcome
    puts "#{tab_pad(3)} Welcome to Twenty-One:"
  puts "#{tab_pad(2)} The first to 5 winning hands is the victor"
  new_line

  puts "Press ENTER to continue"
  get_input("")
end

def display_winner(player_str, auto = false)
  if auto == true
    puts "#{tab_pad(3)} \e[1m The #{player_str} has automatically won\e[0m"
  else
    puts "#{tab_pad(3)} \e[1m The #{player_str} has won this round\e[0m"
  end
end

def display_game_status(dealer, wins, total, player = nil)
  puts "\e[1m\e[32mYour Wins\e[0m: #{wins[:player]}"
  puts "\e[1m\e[31mDEALER Wins\e[0m: #{wins[:dealer]}"
  new_line

  if !player.nil?
    puts "\e[1m\e[32mYour Total\e[0m: #{total[:player]}"
    puts "\e[1m\e[32mYour Hand:\e[0m:"
    display_player_hand(player)
    new_line
  end
  puts "\e[1m\e[31mDEALER HAND\e[0m: #{display_dealer_hand(dealer)}"
  new_line
end

def determine_winner(hsh)
  if hsh[:player] == hsh[:dealer]
    'tie'
  elsif hsh[:player] > hsh[:dealer]
    'player'
  else
    'dealer'
  end
end

def display_win_count(win_hsh)
  puts "\e[1m\e[32mYour Wins\e[0m: #{win_hsh[:player]}"
  puts "\e[1m\e[31mDEALER Wins\e[0m: #{win_hsh[:dealer]}"
end

def player_turn(player_hand, player_total, player_wins)
end

## MAIN GAME LOOP ##
clear_screen
display_welcome

loop do
  wins = {
      player: 0,
      dealer: 0
    }
  loop do
    deck = generate_deck

    total = {
      player: 0,
      dealer: 0
    }

    player_hand = {}
    dealer_hand = {}

    # binding.pry

    deal_cards(deck, 2, total, player_hand, :player)
    deal_cards(deck, 2, total, dealer_hand, :dealer)

    ## PLAYER TURN ##
    loop do
      clear_screen
      calc_total(total, player_hand, :player)
      display_game_status(dealer_hand, wins, total, player_hand)
      stay = nil
      bust = nil

      if total[:player] > TARGET_NUM
        puts bust('Player')
        bust = true
      elsif total[:player] == TARGET_NUM
        auto_stay
        press_end_to_cont
        break
      else
        case hit_or_stay?
        when 'hit'
          display_move('hit', 'Player')
          deal_cards(deck, 1, total, player_hand, :player)

        when 'stay'
          display_move('stay','Player')
          stay = true
        end
      end

      press_end_to_cont
      break if bust || stay
    end

    ## Computer Turn ##
    loop do
      clear_screen
      calc_total(total, dealer_hand, :dealer)

      break if total[:player] > TARGET_NUM

      until total[:dealer] >= DEALER_LIMIT
        clear_screen
        display_move('hit', 'Dealer')

        deal_cards(deck, 1, total, dealer_hand, :dealer)
        display_game_status(dealer_hand, wins, nil)

        calc_total(total, dealer_hand, :dealer)

        press_end_to_cont
      end

      clear_screen

      if total[:dealer] > TARGET_NUM
        bust('Dealer')
      else
        display_game_status(dealer_hand, wins, nil)
        display_move('stay', 'Dealer')
      end

      press_end_to_cont
      break
    end

    ## END OF ROUND ##
    loop do
      clear_screen
      if auto_win?(total)
        if total[:dealer] < TARGET_NUM
          display_winner('Dealer', true)
          wins[:dealer] += 1
        else
          display_winner('Player', true)
          wins[:player] += 1
        end
      else
        display_totals(total)

        case determine_winner(total)
        when 'tie'
          puts "#{tab_pad(3)} \e[1m\e[34m It's a tie\e[0m"
        when 'player'
          display_winner('Player')
          wins[:player] += 1
        when 'dealer'
          display_winner('Dealer')
          wins[:dealer] += 1
        end
      end
      press_end_to_cont
      break
    end
    break if wins[:dealer] == 5 || wins[:player] == 5
  end

  ## END OF GAME ##
  clear_screen
  display_win_count(wins)

    if wins[:player] == 5
      puts "#{tab_pad(3)} \e[1m\e[32m Congradulations!"
      puts "#{tab_pad(3)} You have won the game!\e[0m"
    else
      puts "#{tab_pad(3)} \e[1m\e[31mBetter luck next time...\e[0m"
    end

  puts "#{tab_pad(3)} Would you like to play again?"
  puts "#{tab_pad(3)} YES: 'yes' 'y' ; NO: 'no' 'n'"

  answer = get_input(%w(yes Yes y Y no No n N))
  break if answer == 'no' || answer == 'n'
end

puts "#{tab_pad(3)} EXITING PROGRAM..."
