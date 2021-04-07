require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestBool < MiniTest::Test
  def test_true_return
    assert 2.odd?, 'This value is not odd'
  end
end