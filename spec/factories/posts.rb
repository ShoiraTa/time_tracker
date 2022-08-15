FactoryBot.define do
  factory :post do
    association :user
    date {Date.today}
    rationale {"post 1"}
  end
end