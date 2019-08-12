FactoryBot.define do
  factory :todo_list_item do
    todo_list
    content { Faker::Lorem.words(number: 5).join("") }
    complete { false }
  end
end
