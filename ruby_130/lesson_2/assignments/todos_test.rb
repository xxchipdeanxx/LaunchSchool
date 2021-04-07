require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'todos'

require 'minitest/reporters'
MiniTest::Reporters.use!

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first) 
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) {@list.add(3)}
    assert_raises(TypeError) {@list.add('hi')}
    assert_raises(TypeError) {@list.add([])}
  end

  def test_shovel_method
    todo4 = Todo.new('Walk Dog')
    @list << todo4
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add_method
    todo4 = Todo.new('Walk Dog')
    @list.add(todo4)
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) {@list.item_at(100)}
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(100)}
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false,@todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(100)}
    @todos.each(&:done!)
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(100)}
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal(2, @list.size)
  end

  def test_to_s_empty
    empty = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(empty,@list.to_s)
  end

  def test_to_s_one_done
    one_done = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(one_done, @list.to_s)
  end

  def test_to_s_all_done
    all_done = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(all_done, @list.to_s)
  end

  def test_each_iterator
    results = []
    @list.each {|todo| results << todo}
    assert_equal(@todos, results)
  end

  def test_each_return
    assert_equal(@list, @list.each{})
  end

  def test_select_done
    @list.mark_done_at(1)
    assert_equal(@todo2, @list.select(&:done?).first)
  end

  def test_empty_return
    assert_empty(@list.select(&:done?).to_a)
  end

  def test_select_new_return_obj
    refute_same(@list,@list.select(&:done?))
  end









end