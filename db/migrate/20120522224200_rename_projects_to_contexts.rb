class RenameProjectsToContexts < ActiveRecord::Migration
  def change
    rename_table :projects, :contexts
  end
end
