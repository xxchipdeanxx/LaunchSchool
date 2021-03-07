#What would it take if we wanted to include a tipping option to this program?
#What would it take to expand or order to multple family members?
#Is there a wasy to easily split the bill amongst all our customers?

module TerminalControl
  def clear
    system('clear') || system('cls')
  end
end


class MenuItem
  def initialize
    @option = choose_option
  end
  
  def choose_option
    puts "Please choose a #{self.class} option:"
    display_item_options # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end

  def display_item_options
    self.class::OPTIONS.each do |option_num, item|
      puts "#{option_num}: #{item[:name]} -- #{item[:cost]}"
    end
  end

  def to_s
    self.class::OPTIONS[@option][:name]
  end

  def cost
    self.class::OPTIONS[@option][:cost]
  end
end

class Burger < MenuItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }
end

class Side < MenuItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }
end

class Drink < MenuItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }
end

class Order
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new

    def total
      total_cost = @burger.cost + @side.cost + @drink.cost
    end
  end

  def to_s
   puts meal.map(&:to_s).join(', ')
  end

  def meal
    [@burger, @side, @drink]
  end
end

class Customer
  def place_order
    @order = Order.new
  end

  def display_order
    "#{@order}"
  end

  def total
    @order.total
  end
end

## Begin BONUS CODE ##

class Transaction
  TIPS = {
    '1' => 10,
    '2' => 15,
    '3' => 20,
    '4' => 25
  }.freeze
  include TerminalControl

  def initialize
    @guests = []
    guest_count.times {@guests << Customer.new}
  end

  def start_transaction
    get_orders
    calculate_tab
    display_tab
    adjust_total(tip_amount) if include_tip?
    display_tab('final')
  end

  private

  def guest_count
    puts 'How many guests will be eating today?'
    puts "We can seat a MAX of 10 guests"
    guests = nil
    loop do
      guests = gets.chomp.to_i
      break if (1..10).cover?(guests)
      puts "Please try again"
    end
    guests
  end

  def get_orders
    @guests.each_with_index do |guest, seat_num|
      clear
      puts "Guest Number: #{seat_num + 1}"
      guest.place_order
    end
  end

  def calculate_tab
    @final_tab = @guests.map(&:total).sum
  end

  def display_tab(final = nil)
    puts "The #{final} bill is #{format('$%.2f', @final_tab)}"
  end

  def include_tip?
    puts "Would you like to include a tip?"
    puts "Enter Y for Yes and N for No"
    input = nil
    loop do
      input = gets.chomp.downcase
      break if %w(y n).include?(input)
      puts "Please enter Y or N"
    end
    input == 'y'
  end

  def tip_amount
    puts 'Please select a tip amount:'
    display_tip_tier
    selection = nil
    loop do
      selection = gets.chomp
      break if TIPS.keys.include?(selection)
      puts "Please choose a valid selection."
    end
    TIPS[selection].to_f / 100
  end

  def adjust_total(tip_amount)
    @final_tab *= (1 + tip_amount)
  end

  def display_tip_tier
    TIPS.each do |number, amount|
      puts "#{number} : #{amount}%"
    end
  end

end

johnson_party = Transaction.new
johnson_party.start_transaction






