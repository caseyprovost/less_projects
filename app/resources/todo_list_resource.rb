class TodoListResource < ApplicationResource
  filter :project_id, :integer do
    eq do |scope, value|
      scope.where(project_id: value)
    end
  end

  belongs_to :project
  has_many :todo_list_items

  attribute :name, :string
end
