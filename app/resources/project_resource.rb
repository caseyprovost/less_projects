class ProjectResource < ApplicationResource
  filter :has_todo_lists, :boolean do
    eq do |scope, value|
      if value
        scope.joins(:todo_lists)
      else
        scope.left_joins(:todo_lists).
          where("todo_lists.id is null")
      end
    end
  end

  has_many :todo_lists
  has_many :todo_list_items

  attribute :name, :string
  attribute :description, :string
  attribute :purpose, :string
  attribute :status, :string
end
