class TodoList < ApplicationRecord
  belongs_to :project
  has_many :todo_list_items

  validates :name, presence: true
end
