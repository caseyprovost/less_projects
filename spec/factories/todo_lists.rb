FactoryBot.define do
  factory :todo_list do
    project
    sequence(:name) { |n| "#{Faker::Beer.name} #{n}" }
  end
end
