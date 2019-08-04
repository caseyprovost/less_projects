class CreateTodoListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_list_items do |t|
      t.references :todo_list, null: false, foreign_key: true, index: true
      t.string :content, null: false
      t.boolean :complete, null: false, default: false

      t.timestamps
    end
  end
end
