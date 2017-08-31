FactoryGirl.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    admin { FFaker::Boolean.random }
  end
end