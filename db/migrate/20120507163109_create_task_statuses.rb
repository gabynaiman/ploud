class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.string :name, :null => false
      t.references :context, :null => false

      t.timestamps
      t.auditstamps
    end
    add_index :task_statuses, :context_id
  end
end
