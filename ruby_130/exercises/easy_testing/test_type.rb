require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestInstances < MiniTest::Test
  def test_instances
    value = 4
    assert_instance_of(Numeric, value)
  end
end