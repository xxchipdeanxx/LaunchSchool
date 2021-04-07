require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestType < MiniTest::Test
  def test_type
    value = 3.0
    assert_kind_of(Numeric, value)
  end
end