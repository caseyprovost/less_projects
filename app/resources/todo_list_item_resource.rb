class TodoListItemResource < ApplicationResource
  filter :todo_list_id, :integer do
    eq do |scope, value|
      scope.where(todo_list_id: value)
    end
  end

  belongs_to :todo_list

  attribute :content, :string
  attribute :complete, :boolean
end
