require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class CustomerDB
  def initialize
    @db = []
  end

  def process
    self
  end
end

class TestSame < MiniTest::Test
  def test_same
    list = CustomerDB.new
    assert_same(list, list.process)
  end
end