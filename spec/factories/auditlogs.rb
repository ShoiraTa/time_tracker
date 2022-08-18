FactoryBot.define do
  factory :auditlog do
    user { nil }
    status { 1 }
    start_date { "2022-08-18" }
    end_date { "2022-08-18" }
  end
end
