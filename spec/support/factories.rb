FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}"}
    email "username@gmail.com"
    password "password"
  end
end
