class CreateTaskRunner < ActiveRecord::Migration[6.0]
  def change
    create_table :task_runners do |t|
      t.string :task_name
      t.string :feed_name
      t.boolean :running, default: false
    end
  end
end
