FactoryBot.define do
  factory :post do
    user
    date {Date.today}
    rationale {"post admin"}
    overtime_hours {1}
  end
  factory :non_admin_post, class: 'Post' do
    user
    date {Date.today}
    rationale {"post user"}
    overtime_hours {1}
  end
end