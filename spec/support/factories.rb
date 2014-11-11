FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}"}
    email "username@gmail.com"
    password "password"
  end

  factory :post do
    sequence(:title) { |n| "Healthy Alternative #{n}" }
    url "http://www.kimshealthyeats.com/"
    description "This is a great alternative for bacon"
  end
end
