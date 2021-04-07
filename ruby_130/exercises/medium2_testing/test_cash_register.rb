require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register' #autofills '.rb'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(16)
  end

  def test_accept_money
    before_balance = @register.total_money
    @transaction.amount_paid = 16.00
    @register.accept_money(@transaction)
    final_balance = @register.total_money

    assert_equal (before_balance + 16), final_balance
  end

  def test_change
    @transaction.amount_paid = 20 
    change = @register.change(@transaction)

    assert_equal(4, change)
  end

  def test_recipt
    exp_string = "You've paid $16.\n"
    assert_output(exp_string) {@register.give_receipt(@transaction)}
  end
end