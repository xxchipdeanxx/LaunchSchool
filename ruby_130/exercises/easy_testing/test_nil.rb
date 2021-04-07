require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TestNil < MiniTest::Test
  def test_nil
    value = nil
    assert_nil(value)
  end
end