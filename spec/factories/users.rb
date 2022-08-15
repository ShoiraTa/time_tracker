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
  end
end
