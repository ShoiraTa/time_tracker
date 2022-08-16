FactoryBot.define do
  factory :post do
    user
    date {Date.today}
    rationale {"post admin"}
  end
  factory :non_admin_post, class: 'Post' do
    user
    date {Date.today}
    rationale {"post user"}
  end
end