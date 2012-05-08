class AddToDoToTaskStatuses < ActiveRecord::Migration
  def change
    add_column :task_statuses, :todo, :boolean, :default => false, :null => false
  end
end
