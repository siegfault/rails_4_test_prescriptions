class Task
  attr_accessor :completed_at, :size

  def initialize(size:, completed_at: nil)
    @size = size
    @completed_at = completed_at
  end

  def mark_completed(completed_at=Time.now)
    self.completed_at = completed_at
  end

  def complete?
    !completed_at.nil?
  end

  def part_of_velocity?
    complete? && completed_at > 3.weeks.ago
  end

  def points_towards_velocity
    if part_of_velocity?
      size
    else
      0
    end
  end
end
