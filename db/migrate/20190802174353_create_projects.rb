class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :purpose
      t.string :status

      t.timestamps
    end
  end
end
