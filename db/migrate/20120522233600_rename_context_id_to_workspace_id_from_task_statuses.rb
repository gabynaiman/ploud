class RenameContextIdToWorkspaceIdFromTaskStatuses < ActiveRecord::Migration
  def change
    remove_index :task_statuses, :context_id
    rename_column :task_statuses, :context_id, :workspace_id
    add_index :task_statuses, :workspace_id
  end
end
