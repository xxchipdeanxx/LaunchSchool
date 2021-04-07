class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class CrummyError < StandardError; end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError,'Can only add Todo objects' unless todo.instance_of? Todo
    @todos << todo
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    self.item_at(index).done!
  end

  def mark_undone_at(index)
    self.item_at(index).undone!
  end

  def mark_all_done
    self.each(&:done!)
  end

  def mark_all_undone
    self.each(&:undone!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(self.item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new(title)
    self.each do |todo|
      new_list << todo if yield(todo)
    end
    new_list
  end

  def find_by_title(title_query)
    self.select { |todo| todo.title == title_query }.first
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !(todo.done?) }
  end

  def mark_done(todo_query)
    #add the first argument to force a nil return should the title not exist
    #Ruby interpreter will short circut upon find_by_title returning nil and
    #never imprement the second portion of the conditional IF the title does
    #not exist
    find_by_title(todo_query) && find_by_title(todo_query).done!
  end
end






