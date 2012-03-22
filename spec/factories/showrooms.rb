# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showroom do
    association :user
  end
end
