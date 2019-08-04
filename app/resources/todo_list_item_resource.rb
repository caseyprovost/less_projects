class TodoListItemResource < ApplicationResource
  belongs_to :todo_list

  attribute :content, :string
  attribute :complete, :boolean
end
