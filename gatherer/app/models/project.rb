class Project
  attr_accessor :due_date, :tasks

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

  def completed_velocity
    tasks.sum(&:points_towards_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / 21
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    projected_completion_date <= due_date
  end

  private
  def incomplete_tasks
    tasks.reject(&:complete?)
  end

  def projected_completion_date
    projected_days_remaining.days.from_now
  end
end
