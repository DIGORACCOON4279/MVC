require_relative 'task'
require_relative 'tasks_view'

class TasksController
  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    display_tasks
  end

  def add
    # 1. Get description from view
    description = @view.ask_for_description
    # 2. Create new task
    task = Task.new(description)
    # 3. Add to repo
    @repository.create(task)
  end

  def mark_as_done
    # 1. Display list with indices
    display_tasks
    # 2. Ask user for index
    index = @view.ask_for_index
    # 3. Fetch task from repo
    task = @repository.find(index)
    # 4. Mark task as done
    task.mark_as_done!
  end

  def remove
    # 1. Display list with indices
    display_tasks
    # 2. Ask user for index
    index = @view.ask_for_index
    # 3. Remove from repository
    @repository.destroy(index)
  end

  private

  def display_tasks
    # 1. Fetch tasks from repo
    tasks = @repository.all
    # 2. Send them to view for display
    @view.display_list(tasks)
  end
end
