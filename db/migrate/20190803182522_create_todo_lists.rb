class CreateTodoLists < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_lists do |t|
      t.references :project, null: false, foreign_key: true, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
