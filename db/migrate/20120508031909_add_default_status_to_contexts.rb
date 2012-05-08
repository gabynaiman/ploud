class AddDefaultStatusToContexts < ActiveRecord::Migration
  def change
    add_column :contexts, :default_status_id, :integer
  end
end
