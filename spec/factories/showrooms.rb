# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showroom do
    association :user
  end
  
  factory :outdated_showroom, :parent => :showroom do
    created_at (1.month.ago.beginning_of_day - 1.day)
  end
  
  factory :not_outdated_showroom, :parent => :showroom do
    created_at 1.month.ago
  end
end
