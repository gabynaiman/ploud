class RenameContextsToWorkspaces < ActiveRecord::Migration
  def change
    rename_table :contexts, :workspaces
  end
end
