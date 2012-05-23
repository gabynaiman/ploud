class RenameProjectIdToContextIdFromWorkspaces < ActiveRecord::Migration
  def up
    remove_index :workspaces, :name => :index_contexts_on_project_id
    rename_column :workspaces, :project_id, :context_id
    add_index :workspaces, :context_id
  end

  def down
    remove_index :workspaces, :context_id
    rename_column :workspaces, :context_id, :project_id
    add_index :workspaces, :project_id, :name => :index_contexts_on_project_id
  end
end
