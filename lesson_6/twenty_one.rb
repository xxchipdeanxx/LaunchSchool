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
  gets.chomp
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

def hit_or_stay?
  puts "#{tab_pad(3)}Would you like to HIT or STAY"
  puts "#{tab_pad(2)}HIT: 'hit' or 'h'; STAY: 's' or 'stay'"
  answer = get_input(%w(hit h stay s))
  if answer == 'hit' || answer == 'h'
    'hit'
  else
    'stay'
  end
end

def bust(player_str)
  puts "#{tab_pad(3)}\e[1m\e[31m#{player_str} HAS GONE BUST!\e[0m"
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

def adjust_ace(deck, suit, player_hand)
  if player_hand[:total] + 11 > TARGET_NUM
    deck[suit][:Ace] = 1
  else
    deck[suit][:Ace] = 11
  end
end

def deal_cards(deck, num, *player)
  player.each do |player_hand|
    num.times do
      random_suit = deck.keys.sample
      random_card = deck[random_suit].keys.sample

      adjust_ace(deck, random_suit, player_hand) if random_card == :Ace

      if player_hand.key?(random_suit)
        player_hand[random_suit] << deck[random_suit].slice(random_card)
      else
        player_hand[random_suit] = [deck[random_suit].slice(random_card)]
      end
      deck[random_suit].delete(random_card)
    end
  end
end

def calc_total(*player)
  player.each do |player_profile|
    player_profile[:total] = 0 # temporarily resets total for incrementation
    player_hand = player_profile.select { |suit| suit != :total }
    player_hand.each do |suit|
      player_hand[suit[0]].each do |card|
        player_profile[:total] += card.values.sum
      end
    end
  end
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

def display_game_status(dealer, player_wins, dealer_wins, player = nil)
  puts "\e[1m\e[32mYour Wins\e[0m: #{player_wins}"
  puts "\e[1m\e[31mDEALER Wins\e[0m: #{dealer_wins}"
  new_line

  if !player.nil?
    puts "\e[1m\e[32mYour Total\e[0m: #{player[:total]}"
    puts "\e[1m\e[32mYour Hand:\e[0m:"
    display_player_hand(player)
    new_line
  end
  puts "\e[1m\e[31mDEALER HAND\e[0m: #{display_dealer_hand(dealer)}"
  new_line
end

def determine_winner(player, dealer)
  if player[:total] == dealer[:total]
    'tie'
  elsif player[:total] > dealer[:total]
    'player'
  else
    'dealer'
  end
end

## MAIN GAME LOOP ##
clear_screen
puts "#{tab_pad(3)} Welcome to Twenty-One:"
puts "#{tab_pad(2)} The first to 5 winning hands is the victor"
new_line

puts "Press ENTER to continue"
get_input("")

loop do
  player_wins = 0
  dealer_wins = 0
  loop do
    deck = {
      hearts: generate_cards,
      diamonds: generate_cards,
      spades: generate_cards,
      clubs: generate_cards
    }

    player = {
      total: 0
    }

    dealer = {
      total: 0
    }

    deal_cards(deck, 2, player, dealer)

    ## PLAYER TURN ##
    loop do
      clear_screen
      calc_total(player)
      display_game_status(dealer, player_wins, dealer_wins, player)
      stay = nil
      bust = nil

      if player[:total] > TARGET_NUM
        bust('Player')
        bust = true
      elsif player[:total] == TARGET_NUM
        auto_stay
        puts "Press ENTER to continue"
        get_input("")
        break
      else
        case hit_or_stay?
        when 'hit'
          puts "You have opted to HIT"
          deal_cards(deck, 1, player)
        when 'stay'
          puts "You have opted to STAY"
          stay = true
        end
      end

      puts "Press ENTER to continue"
      get_input("")
      break if bust || stay
    end

    ## Computer Turn ##
    loop do
      clear_screen
      calc_total(dealer)

      break if player[:total] > TARGET_NUM

      until dealer[:total] >= DEALER_LIMIT
        clear_screen
        puts "#{tab_pad(3)}The dealer has opted to HIT"

        deal_cards(deck, 1, dealer)
        display_game_status(dealer, player_wins, dealer_wins, nil)

        calc_total(dealer)

        puts "Press ENTER to continue"
        get_input("")
      end

      clear_screen

      if dealer[:total] > TARGET_NUM
        bust('Dealer')
      else
        display_game_status(dealer, player_wins, dealer_wins, nil)
        puts "#{tab_pad(3)}The dealer has opted to STAY"
      end

      puts "Press ENTER to continue"
      get_input("")
      break
    end

    ## END OF ROUND ##
    loop do
      clear_screen
      if player[:total] > TARGET_NUM
        puts "#{tab_pad(3)} \e[1m The dealer has automatically won\e[0m"
        dealer_wins += 1
      elsif dealer[:total] > TARGET_NUM
        puts "#{tab_pad(3)} \e[1m\e[32m You have automatically won!\e[0m"
        player_wins += 1
      else
        puts "\e[1m\e[32m Your Total\e[0m: #{player[:total]}"
        puts "\e[1m\e[31m Dealer Total\e[0m: #{dealer[:total]}"

        case determine_winner(player, dealer)
        when 'tie'
          puts "#{tab_pad(3)} \e[1m\e[34m It's a tie\e[0m"
        when 'player'
          puts "#{tab_pad(3)} \e[1m\e[32m You have won!\e[0m"
          player_wins += 1
        when 'dealer'
          puts "#{tab_pad(3)} \e[1m Looks like the dealer has won\e[0m"
          dealer_wins += 1
        end
      end
      puts "Press ENTER to continue"
      get_input("")
      break
    end
    break if dealer_wins == 5 || player_wins == 5
  end

  ## END OF GAME ##
  clear_screen
  puts "\e[1m\e[32mYour Wins\e[0m: #{player_wins}"
  puts "\e[1m\e[31mDEALER Wins\e[0m: #{dealer_wins}"

  if player_wins == 5
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
