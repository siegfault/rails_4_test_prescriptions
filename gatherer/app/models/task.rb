class Task
  attr_reader :size

  def initialize(size:, completed: false)
    @size = size
    @completed = completed
  end

  def mark_completed
    @completed = true
  end

  def complete?
    @completed
  end
end
