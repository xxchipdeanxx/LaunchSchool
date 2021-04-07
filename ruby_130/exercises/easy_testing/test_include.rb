require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestInclude < MiniTest::Test
  def test_inclusion
    list = %w(xyz ABC 123)
    assert_includes(list, 'xyz')
  end
end