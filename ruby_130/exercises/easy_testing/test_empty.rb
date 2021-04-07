require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class MyClass; end

class TestEmpty < MiniTest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end