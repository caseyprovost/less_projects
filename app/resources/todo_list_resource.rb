class TodoListResource < ApplicationResource
  belongs_to :project
  has_many :todo_list_items

  attribute :name, :string
end
