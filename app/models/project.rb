class Project < ApplicationRecord
  has_many :todo_lists
  has_many :todo_list_items, through: :todo_lists

  validates :name, presence: true
end
