require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestExp < MiniTest::Test
  def test_exceptions
    assert_raises(TypeError) {}
  end
end