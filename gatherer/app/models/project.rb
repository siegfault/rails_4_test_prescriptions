class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    incomplete_tasks.none?
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end

  private
  def incomplete_tasks
    tasks.reject(&:complete?)
  end
end
