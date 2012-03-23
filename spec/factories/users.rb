# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}#{rand(100)}@test.com"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
    role "user"
  end

  factory :admin, :parent => :user do
    password "secure"
    password_confirmation "secure"
    role "admin"
  end
end
