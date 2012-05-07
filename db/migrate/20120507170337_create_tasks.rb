class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, :null => false
      t.text :description
      t.references :context
      t.references :task_status

      t.timestamps
      t.auditstamps
    end
    add_index :tasks, :context_id
    add_index :tasks, :task_status_id
  end
end
