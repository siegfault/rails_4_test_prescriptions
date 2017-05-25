require 'rails_helper'

RSpec.describe Task do
  let(:task) { Task.new(size: 0) }

  it 'can distinguish a completed task' do
    expect(task).not_to be_complete
    task.mark_completed
    expect(task).to be_complete
  end
end
