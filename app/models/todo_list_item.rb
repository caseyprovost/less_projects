class TodoListItem < ApplicationRecord
  belongs_to :todo_list

  validates :content, presence: true

  def project
    todo_list&.project
  end
end
