#Valentina is using a new task manager program she wrote. 
#When interacting with her task manager, an error is raised that surprises her. 
#Can you find the bug and fix it?

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    high_priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

#Our issue here is that Valentina has chosen a local variable 'tasks' on line 39
# that basically shadows our instance variable @tasks (accessed by the GETTER method)
#TaskManager#tasks)

#Ruby thus interprets task.select ... as an attempt to call the #select method
#on our newly created local variable tasks instead of our intance variable tasks
  #Since (local)tasks has not been assigned a value --> it will default to nil which is the only
  #member of NilClass 
#By using the same name for both variables Valentina has created ambiguity that
#the Ruby interpreter is unable to understand

#The solution is to select a more explicit and specific name for her local variable
# so that @tasks is not eclipsed and will thus maintin its intended scope