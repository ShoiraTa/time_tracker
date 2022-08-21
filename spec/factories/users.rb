FactoryBot.define do
  sequence :email do |n|
    "person#{n+1000}@example.com"
  end
  factory :user do
    email
    password {'asdfasdf'}
    password_confirmation {'asdfasdf'}
    first_name { 'Jon' }
    last_name {"Snow"}
    phone_number {'995551113368'}
    type {'Employee'}
    ssn {123456}
    company {'abc'}

    trait :with_post do
      after(:create) do |user|
        create(:non_admin_post, user: user)
      end
    end
    trait :with_auditlog do
      after(:create) do |user|
        create(:auditlog, user: user)
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
    phone_number {'995551113368'}
    ssn {1234567}
    company {'abc'}

    trait :with_post do
      after(:create) do |user|
        create(:post, user: user)
      end
    end
  end
end
