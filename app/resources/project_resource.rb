class ProjectResource < ApplicationResource
  has_many :todo_lists
  has_many :todo_list_items

  attribute :name, :string
  attribute :description, :string
  attribute :purpose, :string
  attribute :status, :string
end
