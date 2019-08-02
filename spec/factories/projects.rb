FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { "Something cool" }
    purpose { "To organize the project" }
    status { "active" }
  end
end
