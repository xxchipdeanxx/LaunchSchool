require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'

require_relative 'transaction'

Minitest::Reporters.use!

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(35)
  end

  def test_payment_prompt
    input = StringIO.new("40\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(40.0, @transaction.amount_paid)
  end
end