require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize(years_experience = 0)
    @exp = years_experience
  end

  def hire
    @exp <= 0 ? raise(NoExperienceError, "Not enough experience") : self.onboard
  end

  private
  def onboard
    @employee_id = rand(1..100)
    @salary = 30000
  end
end


class TestException < MiniTest::Test
  def setup
    @employee = Employee.new
  end

  def test_no_exp_error
    assert_raises(NoExperienceError) {@employee.hire}
  end
end