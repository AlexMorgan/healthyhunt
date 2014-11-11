FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}"}
    email "username@gmail.com"
    password "password"
  end

  factory :post do
    sequence(:product_name) { |n| "Healthy Alternative #{n}" }
    url "http://www.kimshealthyeats.com/"
    tagline "This is a great alternative for bacon"
    upvote_count 0
  end
end
