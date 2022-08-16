FactoryBot.define do
  factory :post do
    user
    date {Date.today}
    rationale {"post 1"}
  end
end