FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}"}
    sequence(:email) { |n| "username#{n}@gmail.com" }
    password "password"
  end

  factory :post do
    sequence(:product_name) { |n| "Healthy Alternative #{n}" }
    url "http://www.kimshealthyeats.com/"
    tagline "This is a great alternative for bacon"
    user
  end
end
