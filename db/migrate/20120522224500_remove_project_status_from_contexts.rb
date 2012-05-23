class RemoveProjectStatusFromContexts < ActiveRecord::Migration
  def up
    remove_column :contexts, :project_status
  end

  def down
    add_column :contexts, :project_status, :string
  end
end
