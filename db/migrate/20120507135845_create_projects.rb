class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null => false
      t.text :description
      t.string :project_status, :null => false

      t.timestamps
      t.auditstamps
    end
  end
end
