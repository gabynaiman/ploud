class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.string :name, :null => false
      t.references :project, :null => false

      t.timestamps
    end
    add_index :contexts, :project_id
  end
end
