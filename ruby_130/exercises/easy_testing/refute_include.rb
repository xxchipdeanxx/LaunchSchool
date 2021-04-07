require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestRefute < MiniTest::Test
  def test_refute
    list = %w(xyz ABC 1234)
    refute_includes(list, 'xyz')
  end
end