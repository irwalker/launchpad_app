class TaskRunner < ApplicationRecord
  def self.task_running?(task_name, feed_name)
    self.find_or_create_by(task_name: task_name, feed_name: feed_name).running?
  end
end
