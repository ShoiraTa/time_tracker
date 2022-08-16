FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    email
    password {'asdfasdf'}
    password_confirmation {'asdfasdf'}
    first_name { 'Jon' }
    last_name {" Snow"}

    trait :with_post do
      after(:create) do |user|
        create(:non_admin_post, user: user)
      end
    end
  end
  
  factory :admin_user do
    email
    password {'123456'}
    password_confirmation {'123456'}
    first_name { 'Admin' }
    last_name {"User"}
    type {'AdminUser'}

    trait :with_post do
      after(:create) do |user|
        create(:post, user: user)
      end
    end
  end
end
