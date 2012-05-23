class RenameContextIdToWorkspaceIdFromTasks < ActiveRecord::Migration
  def change
    remove_index :tasks, :context_id
    rename_column :tasks, :context_id, :workspace_id
    add_index :tasks, :workspace_id
  end
end
