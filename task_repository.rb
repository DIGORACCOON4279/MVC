class TaskRepository
  def initialize
    @tasks = []
  end

  def create(task)
    @tasks << task
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def destroy(index)
    @tasks.delete_at(index)
  end
end
